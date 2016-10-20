require 'spec_helper'
require 'rails_helper'

describe Category, type: :model do
  it { should have_valid(:category).when('Run', 'Crossfit') }
  it { should_not have_valid(:category).when('', nil) }

  describe '.name' do
    it 'returns the name of the city' do
      category = FactoryGirl.create(:category, category: "Run")
      result = category.category

      expect(result).to eq("Run")
    end
  end
end
