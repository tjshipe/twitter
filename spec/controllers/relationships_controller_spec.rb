require 'rails_helper'

RSpec.describe RelationshipsController, type: :controller do
  login_user

  let(:user2) { FactoryGirl.create(:user) }
  let(:relationship) { @user.following_relationships.find_by(followed_id: user2.id) }

  describe "GET #create" do
    it "redirects to post index" do
      post :create, {relationship: {followed_id: user2.id}}
      expect(@user.followed_users).to include(user2)
      expect(response).to redirect_to(users_url)
    end
  end

  describe "DELETE #destroy" do
    
    before do
      @user.follow!(user2)
    end

    it "reduces relationship count by one" do
      expect { delete :destroy, id: relationship.id }.to change(Relationship, :count).by(-1)
    end

    it "redirects to post index" do
      delete :destroy, id: relationship.id
      expect(response).to redirect_to(users_url)
    end
  end
end
