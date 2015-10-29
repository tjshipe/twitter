class RelationshipsController < ApplicationController
  before_action :authenticate_user!

  def create
    if @user = User.find(params[:relationship][:followed_id])
      current_user.follow!(@user)
      redirect_to users_path, notice: "You are now following #{@user.email}."
    else
      redirect_to users_path, notice: 'Not able to follow this user.'
    end
  end

  def destroy
    if @user = Relationship.find(params[:id]).followed
      current_user.unfollow!(@user)
      redirect_to users_path, notice: "You are no longer following #{@user.email}"
    else
      redirect_to users_path, notice: 'Not able to unfollow.'
    end
  end
end
