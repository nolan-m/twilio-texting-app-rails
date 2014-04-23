require 'spec_helper'
include Warden::Test::Helpers
Warden.test_mode!



feature "user has many contact", :vcr => true  do
  scenario "user adds contact through nav bar link" do
    create_user_and_sign_in
    click_link "Contacts"
    click_link 'Add Contact'
    fill_in "Name", with: "Friend"
    fill_in "Phone", with: "123-456-7890"
    click_button "Create Contact"
    page.should have_content "Friend | 1234567890"
  end

  scenario "user adds contact after sending a text message to that user" do
    create_user_and_sign_in
    click_link "New Message"
    fill_in "From", with: "15005550006"
    fill_in "to_tags[]", with: "2198778874"
    fill_in "Message", with: "Hey, I will add you to my contacts"
    check "Save contact"
    fill_in "Name", with: "Nolan"
    click_button "Create Message"
    click_link "Contacts"
    page.should have_content "Nolan | 2198778874"
  end
end
