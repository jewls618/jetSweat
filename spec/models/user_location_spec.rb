require 'spec_helper'
require 'rails_helper'

describe UserLocation, type: :model do
  it { should have_valid(:user_id).when(1, 12) }
  it { should have_valid(:location_id).when(1, 2) }
end
