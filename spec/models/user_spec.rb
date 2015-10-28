require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { FactoryGirl.create(:user) }

  subject { user }

  it { should respond_to(:posts) }
  it { should respond_to(:email) }
  it { should respond_to(:followers) }
  it { should respond_to(:followed_users) }
end
