require 'spec_helper'
require 'rails_helper'

describe Favorite, type: :model do
  it { should have_valid(:workout_id).when('1', '2') }
  it { should_not have_valid(:workout).when(nil) }
  it { should have_valid(:user_id).when('1', '2') }

context "favorite's relationship between workouts and users" do
  let!(:user) { FactoryGirl.create(:user, first_name: "Billy", last_name: "Bob", email: "hi@test.com") }
  let!(:location) { FactoryGirl.create(:location, city: "Boston") }
  let!(:workout) { FactoryGirl.create(:workout, name: "Golds Gym", street: "123 Main St", category_id: category.id, location_id: location.id) }
  let!(:category) { FactoryGirl.create(:category, category: "Gym") }
  let!(:favorite) { Favorite.create(workout_id: workout.id, user_id: user.id) }

  describe '.workout.category.category' do
    it 'returns the category name of the workout' do
      result = favorite.workout.category.category

      expect(result).to eq("Gym")
    end
  end

    describe '.workout.name' do
      it 'returns the name of the workout' do
        result = favorite.workout.name

        expect(result).to eq("Golds Gym")
      end
    end

    describe '.workout.street' do
      it 'returns the address of the workout' do
        result = favorite.workout.street

        expect(result).to eq("123 Main St")
      end
    end

    describe '.user.first_name' do
      it 'returns the first name of the user' do
        result = favorite.user.first_name

        expect(result).to eq("Billy")
      end
    end

    describe '.user.last_name' do
      it 'returns the last name of the user' do
        result = favorite.user.last_name

        expect(result).to eq("Bob")
      end
    end

    describe '.user.email' do
      it 'returns the email of the user' do
        result = favorite.user.email

        expect(result).to eq("hi@test.com")
      end
    end
  end
end
