require 'spec_helper'
require 'rails_helper'

describe Comment, type: :model do
  it { should have_valid(:body).when('Run', 'Crossfit') }
  it { should_not have_valid(:body).when('', nil) }
  it { should have_valid(:user_id).when(1, 2) }
  it { should_not have_valid(:user_id).when('', nil) }
  it { should have_valid(:workout_id).when(1, 2) }
  it { should_not have_valid(:workout_id).when('', nil) }

  context "comment's relationship between workouts and users" do
    let!(:user) { FactoryGirl.create(:user, first_name: "Billy", last_name: "Bob", email: "hi@test.com", username: "bestuser") }
    let!(:location) { FactoryGirl.create(:location, city: "Boston") }
    let!(:workout) { FactoryGirl.create(:workout, name: "Golds Gym", street: "123 Main St", category_id: category.id, location_id: location.id) }
    let!(:category) { FactoryGirl.create(:category, category: "Gym") }
    let!(:comment) { Comment.create(body: "The Best!", user_id: user.id, workout_id: workout.id) }

    describe '.body' do
      it 'returns the text of the comment' do
        result = comment.body

        expect(result).to eq("The Best!")
      end
    end

    describe '.user.username' do
      it 'returns the username of the person who made the comment' do
        result = comment.user.username

        expect(result).to eq("bestuser")
      end
    end

    describe '.user.first_name' do
      it 'returns the first name of the person who made the comment' do
        result = comment.user.first_name

        expect(result).to eq("Billy")
      end
    end

    describe '.user.last_name' do
      it 'returns the last name of the person who made the comment' do
        result = comment.user.last_name

        expect(result).to eq("Bob")
      end
    end

    describe '.user.email' do
      it 'returns the email of the user who wrote the comment' do
        result = comment.user.email

        expect(result).to eq("hi@test.com")
      end
    end

    describe '.workout.name' do
      it 'returns the name of the workout where the comment was made' do
        result = comment.workout.name

        expect(result).to eq("Golds Gym")
      end
    end

    describe '.workout.street' do
      it 'returns the address of the workout where the comment was made' do
        result = comment.workout.street

        expect(result).to eq("123 Main St")
      end
    end

    describe '.workout.category.category' do
      it 'returns the name of the category of the workout where the comment was made' do
        result = comment.workout.category.category

        expect(result).to eq("Gym")
      end
    end
  end
end
