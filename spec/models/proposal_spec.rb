require 'spec_helper'

describe Proposal do
  # subject { FactoryGirl.create(:proposal) }

  it { should validate_presence_of :subject }
  it { should validate_presence_of :body }
end
