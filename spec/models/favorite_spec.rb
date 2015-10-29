require 'rails_helper'

RSpec.describe Favorite, type: :model do
  let(:user) { FactoryGirl.create(:user) }
  let(:post) { FactoryGirl.create(:post) }
  let(:favorite) { user.favorites.build(post_id: post.id) }

  subject { favorite }

  it { should respond_to(:user_id) }
  it { should respond_to(:post_id) }

  context "validations" do
    it{ should validate_presence_of(:user_id) }
    it{ should validate_presence_of(:post_id) }
  end

  describe "user methods" do
    it { should respond_to(:user) }
    it { should respond_to(:post) }
    it { expect(favorite.post).to eql(post) }
    it { expect(favorite.user).to eql(user) }
  end
end
