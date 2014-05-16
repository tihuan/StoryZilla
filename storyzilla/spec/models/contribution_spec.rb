require 'spec_helper'

describe Contribution do
  it { should belong_to(:user) }
  it { should belong_to(:story) }
  it { should validate_presence_of(:body) }
end
