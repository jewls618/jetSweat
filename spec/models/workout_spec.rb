require 'spec_helper'
require 'rails_helper'

describe Workout, type: :model do
  it { should have_valid(:name).when('Downtown Crossfit', 'Super Spin') }
  it { should_not have_valid(:name).when('', nil) }
  it { should have_valid(:street).when('123 Main St', '456 My St') }
  it { should_not have_valid(:street).when('', nil) }

  describe '.name' do
    it 'returns the name of the workout' do
      category = FactoryGirl.create(:category)
      location = FactoryGirl.create(:location)
      workout = FactoryGirl.create(:workout, name: "Cross", category_id: category.id, location_id: location.id)
      name = workout.name

      expect(name).to eq("Cross")
    end
  end

  describe '.street' do
    it 'returns the address of the workout' do
      category = FactoryGirl.create(:category)
      location = FactoryGirl.create(:location)
      workout = FactoryGirl.create(:workout, name: "Cross", street: "123 Main St", category_id: category.id, location_id: location.id)
      street = workout.street

      expect(street).to eq("123 Main St")
    end
  end
end
