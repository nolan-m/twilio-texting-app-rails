require 'spec_helper'

describe Message, :vcr => true do
  it { should validate_presence_of :to }
  it { should validate_presence_of :from }
  it { should validate_presence_of :body }

  it { should have_and_belong_to_many :contacts }
  it { should belong_to :user }

  it "dosent save the message if twilio gives an error" do
    message = Message.new(:body => "howdy", :to => "11111", :from => "15005550006")
    message.save.should be_false
  end

  it "displays the status after a message is sent" do
    message = Message.new(:body => "howdy", :to => "15005550006", :from => "15005550006")
    message.save
    message.status.should eq "queued"
  end

  it 'adds an error if the to number is invalid' do
    message = Message.new(:body => 'hi', :to => '1111111', :from => '15005550006')
    message.save
    message.errors.messages[:base].should eq ["The 'To' number 1111111 is not a valid phone number."]
  end
end
