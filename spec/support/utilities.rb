def create_user_and_sign_in
  visit new_user_session_path
  user = FactoryGirl.create(:user)
  login_as(user, :scope => :user)
  click_button 'Sign in'
end
