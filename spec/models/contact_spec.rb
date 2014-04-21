require 'spec_helper'

describe Contact do
  it { should validate_presence_of :name }
  it { should validate_presence_of :phone }

  it { should have_and_belong_to_many :messages }
  it { should belong_to :user }
end
