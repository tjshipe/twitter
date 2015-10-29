require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { FactoryGirl.create(:user) }

  subject { user }

  it { should respond_to(:posts) }
  it { should respond_to(:email) }
  it { should respond_to(:followers) }
  it { should respond_to(:followed_users) }
  it { should respond_to(:favorites) }
  it { should respond_to(:favorite_posts) }
  it { should respond_to(:followed_users) }
  it { should respond_to(:following_relationships) }

  it { should validate_presence_of(:email) }

  describe "methods for following" do

    let(:user2) { FactoryGirl.create(:user) }

    before do
      user.follow!(user2)
    end

    describe "get ids of followed users" do
      it { expect(user.followed_user_ids).to eq([user2.id])}
    end

    describe "allower a user to follow another user" do
      it { should be_following(user2) }
      it { expect(user.followed_users).to include(user2) }
    end

    describe "user2 should see user as a follower" do
      subject { user2 }
      it { expect(user2.followers).to include(user) }
    end

    describe "and unfollowing" do
      before { user.unfollow!(user2) }

      it { should_not be_following(user2) }
      it { expect(user.followed_users).not_to include(user2) }
    end
  end
end
