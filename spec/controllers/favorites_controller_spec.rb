require 'rails_helper'

RSpec.describe FavoritesController, type: :controller do
  login_user

  let(:user) { FactoryGirl.create(:user) }
  let(:favorite) { FactoryGirl.create(:favorite) }

  describe "GET #create" do
    it "redirects to post index" do
      post :create, {favorite: {user_id: user.id}}
      expect(response).to redirect_to(posts_url)
    end
  end
end
