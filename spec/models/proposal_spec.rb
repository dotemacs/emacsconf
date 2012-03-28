require 'spec_helper'

describe Proposal do
  it { should validate_presence_of :subject }
  it { should validate_presence_of :body }
end
