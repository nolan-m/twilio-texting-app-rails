class Contact < ActiveRecord::Base
  validates :name, presence: true
  validates :phone, presence: true

  has_and_belongs_to_many :messages
  belongs_to :user

  before_create :format_number

private

  def format_number
    self.phone.gsub!('-','')
  end

end
