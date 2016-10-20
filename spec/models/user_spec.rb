require 'spec_helper'
require 'rails_helper'

describe User, type: :model do
  it { should have_valid(:first_name).when('Bob', 'Amanda') }
  it { should_not have_valid(:first_name).when('', nil) }
  it { should have_valid(:last_name).when('Smith', 'Doe') }
  it { should_not have_valid(:last_name).when('', nil) }
  it { should have_valid(:email).when('JSmith@gmail.com', 'jDoe@aol.com') }
  it { should_not have_valid(:email).when('', nil) }

  describe '.name' do
    it 'returns the name of the user' do
      user = FactoryGirl.create(:user, first_name: "Johnny", last_name: "Appleseed")
      first_name = user.first_name
      last_name = user.last_name

      expect(first_name).to eq("Johnny")
      expect(last_name).to eq("Appleseed")
    end
  end

  describe '.email' do
    it 'returns the email of the user' do
      user = FactoryGirl.create(:user, email: "callme@maybe.com")
  	  email = user.email

  	  expect(email).to eq("callme@maybe.com")
    end
  end

  describe '.password' do
    it 'returns the password of the user' do
      user = FactoryGirl.create(:user, password: "password123", password_confirmation: "password123")
  	  password = user.password

  	  expect(password).to eq("password123")
    end
  end

  describe '.role' do
    context 'user is a member' do
      it 'returns member' do
        user = FactoryGirl.create(:user)
        member = user.role

        expect(member).to eq("member")
      end
    end

    context 'user is a admin' do
      it 'returns admin' do
        user = FactoryGirl.create(:user, role:"admin")
        admin = user.role

        expect(admin).to eq("admin")
      end
    end
  end

  describe "#admin?" do
    context 'when user is a member' do
      it 'returns false' do
        user = FactoryGirl.create(:user)

        expect(user.admin?).to eq(false)
      end
    end

    context "when user is an admin" do
      it 'returns true' do
        user = FactoryGirl.create(:user, role: "admin")

        expect(user.admin?).to eq(true)
      end
    end
  end
end
