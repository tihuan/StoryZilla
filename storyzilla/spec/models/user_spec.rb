require 'spec_helper'

describe User do
  it { should validate_presence_of(:username) }
  it { should validate_uniqueness_of(:username) }
  it { should allow_value('raderj89', 'jared_rader').for(:username) }
  it { should_not allow_value('Jared Rader', 'jared+rader').for(:username) }

  it { should validate_presence_of(:email) }
  it { should validate_uniqueness_of(:email) }
  it { should allow_value('raderj89@gmail.com', 'phil.london@gm.slc.edu').for(:email) }
  it { should_not allow_value('dsaff', 'rader@').for(:email) }

  it { should validate_presence_of(:password) }

  it { should have_many(:stories) }
end
