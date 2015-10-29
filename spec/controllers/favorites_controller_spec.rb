require 'rails_helper'

RSpec.describe FavoritesController, type: :controller do
  login_user

  let(:user) { FactoryGirl.create(:user) }

  describe "GET #create" do
    it "redirects to post index" do
      post :create, {favorite: {user_id: user.id}}
      expect(response).to redirect_to(posts_url)
    end
  end

  describe "DELETE #destroy" do
    let(:post) { FactoryGirl.create(:post) }
    let(:favorite) { @user.favorites.find_by(post_id: post.id) }

    before do
      @user.favorite_posts << post
    end

    it "reduces favorite count by one" do
      expect { delete :destroy, id: favorite.id }.to change(Favorite, :count).by(-1)
    end

    it "redirects to user index" do
      delete :destroy, id: favorite.id
      expect(response).to redirect_to(posts_url)
    end
  end
end
