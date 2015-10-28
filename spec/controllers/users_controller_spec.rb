require 'rails_helper'

RSpec.describe UsersController, type: :controller do

  let(:valid_attributes) {
    {email: 'test@gmail.com', password: 'password', password_confirmation: 'password'}
  }

  describe "GET #index" do
    it "assigns all users as @users" do
      user = User.create! valid_attributes
      get :index, {}
      expect(assigns(:users)).to eq([user])
    end
  end

  describe "GET #show" do
    it "assigns the requested user as @user" do
      user = User.create! valid_attributes
      get :show, {:id => user.to_param}
      expect(assigns(:user)).to eq(user)
    end
  end
end
