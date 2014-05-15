require 'spec_helper'

describe User do
  # it { should have_many(:stories) }
  it { should validate_presence_of(:username) }
  it { should validate_presence_of(:email) }
end
