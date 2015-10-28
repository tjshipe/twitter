require 'rails_helper'

RSpec.describe Relationship, type: :model do
  let(:relationship) { FactoryGirl.create(:relationship) }

  subject { relationship }

  it { should respond_to(:follower_id) }
  it { should respond_to(:followed_id) }

  context "validations" do
    it{ should validate_presence_of(:follower_id)       }
    it{ should validate_presence_of(:followed_id) }
  end
end
