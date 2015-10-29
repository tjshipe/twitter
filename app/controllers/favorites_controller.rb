class FavoritesController < ApplicationController
  before_action :authenticate_user!

  def index
    @favorites = current_user.favorites
  end
  
  def create
    if current_user.favorites.create(favorite_params)
      redirect_to posts_url, notice: 'Post has been favorited'
    else
      redirect_to posts_url, alert: 'Something went wrong...*sad panda*'
    end
  end
  
  def destroy
    current_user.favorites.find_by(favorite_params).destroy
    redirect_to posts_url, notice: 'Post has been removed from favorites'
  end
  
  private

    def favorite_params
      params.require(:favorite).permit(:post_id)
    end
end
