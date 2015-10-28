require 'rails_helper'

RSpec.describe Favorite, type: :model do
  let(:favorite) { FactoryGirl.create(:favorite) }

  subject { favorite }

  it { should respond_to(:user_id) }
  it { should respond_to(:post_id) }

  context "validations" do
    it{ should validate_presence_of(:user_id)       }
    it{ should validate_presence_of(:post_id) }
  end
end
