require 'spec_helper'

describe Message do
  it { should validate_presence_of :to }
  it { should validate_presence_of :from }
  it { should validate_presence_of :body }

  it { should have_and_belong_to_many :contacts }
  it { should belong_to :user }
end
