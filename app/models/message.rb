class Message < ActiveRecord::Base
    validates :to, presence: true
    validates :from, presence: true
    validates :body, presence: true

    has_and_belongs_to_many :contacts
    belongs_to :user
end
