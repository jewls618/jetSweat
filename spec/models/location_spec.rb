require 'spec_helper'
require 'rails_helper'

describe Location, type: :model do
  it { should have_valid(:city).when('Chicago, IL', 'Boston, MA') }
  it { should_not have_valid(:city).when('', nil) }

  describe '.name' do
    it 'returns the name of the city' do
      location = FactoryGirl.create(:location, city: "Boston, MA")
      location = location.city

      expect(location).to eq("Boston, MA")
    end
  end
end
