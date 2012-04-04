require 'spec_helper'

describe User do

  subject { FactoryGirl.create(:user) }

  it { should validate_presence_of :name }
  it { should validate_presence_of :email }
  it { should validate_uniqueness_of :email }
  it { should validate_presence_of :password }
  it { should have_many :proposals }
  it { should have_many :comments }
end
