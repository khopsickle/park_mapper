class FavoritesController < ApplicationController

  def create
    @favorite = current_user.favorites.build(park_id: params[:park_id])
    if @favorite.save
      flash[:success] = "Park favorited."
    else
      flash[:error] = "Unable to favorite."
    end
    redirect_to :back
  end

  def destroy
    @favorite = Favorite.find_by_id(params[:id])
    if @favorite && @favorite.delete
      flash[:success] = "Park unfavorited."
    else
      flash[:error] = "Unable to remote favorite."
    end
    redirect_to :back
  end
end
