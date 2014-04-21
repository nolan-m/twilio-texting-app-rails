class Message < ActiveRecord::Base
  validates :to, presence: true
  validates :from, presence: true
  validates :body, presence: true

  has_and_belongs_to_many :contacts
  belongs_to :user

  before_create :send_sms

  private

    def send_sms
      begin
       response = RestClient::Request.new(
         :method => :post,
         :url => "https://@api.twilio.com/2010-04-01/Accounts/#{ENV['TWILIO_ACCOUNT_SID']}/Messages.json",
         :user => ENV['TWILIO_ACCOUNT_SID'],
         :password => ENV['TWILIO_AUTH_TOKEN'],
         :payload => { :To => to,
                       :From => from,
                       :Body => body }
       ).execute

      parsed_response = JSON.parse(response)
      self.status = parsed_response['status']
      rescue
        false
      end
    end
end
