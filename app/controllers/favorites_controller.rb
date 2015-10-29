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
    if Favorite.find(params[:id]).destroy
      redirect_to posts_url, notice: 'Post has been removed from favorites'
    else
      redirect_to posts_url, notice: 'Not able to remove favorite'
    end
  end
  
  private

    def favorite_params
      params.require(:favorite).permit(:post_id)
    end
end
