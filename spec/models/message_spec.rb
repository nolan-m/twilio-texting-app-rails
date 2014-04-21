require 'spec_helper'

describe Message do
  it { should validate_presence_of :to }
  it { should validate_presence_of :from }
  it { should validate_presence_of :body }

  it { should have_and_belong_to_many :contacts }
  it { should belong_to :user }

  it "dosent save the message if twilio gives an error" do
    message = Message.new(:body => "howdy", :to => "11111", :from => "7754730713")
    message.save.should be_false
  end

  it "displays the status after a message is sent" do
    message = Message.create(:body => "howdy", :to => "15005550006", :from => "15005550006")
    p message
    message.status.should eq "queued"
  end
end
