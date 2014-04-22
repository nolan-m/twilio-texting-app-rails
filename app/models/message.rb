class Message < ActiveRecord::Base
  validates :to, presence: true
  validates :from, presence: true
  validates :body, presence: true

  has_and_belongs_to_many :contacts
  belongs_to :user

  before_create :send_sms
  before_create :format_number
  after_find :find_status


  private

    def format_number
      self.to.gsub!('-','')
    end

    def find_status
      response = RestClient::Request.new(
           :method => :get,
           :url => "https://@api.twilio.com/2010-04-01/Accounts/#{ENV['TWILIO_ACCOUNT_SID']}/Messages/#{self.sid}.json",
           :user => ENV['TWILIO_ACCOUNT_SID'],
           :password => ENV['TWILIO_AUTH_TOKEN']
         ).execute
      parsed_response = JSON.parse(response)
      self.status = parsed_response['status']
    end



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
      self.sid = parsed_response['sid']
      rescue RestClient::BadRequest => error
        message = JSON.parse(error.response)['message']
        errors.add(:base, message)
        false
      end
    end
end
