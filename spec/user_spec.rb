require 'spec_helper'
require 'rails_helper'

describe User do
  it { should have_valid(:first_name).when('Bob', 'Amanda') }
  it { should have_valid(:last_name).when('Smith', 'Doe') }
  it { should have_valid(:email).when('JSmith@gmail.com', 'jDoe@aol.com') }
end
