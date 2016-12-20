module FavoritesHelper

  def favorite_link(park)
    favorite = Favorite.find_by(park_id: park.id, user_id: current_user.id)
    if favorite
      link_to "Unfavorite", favorite_path(id: favorite.id), method: 'delete'
    else
      link_to "Favorite", favorites_path(park_id: park.id), method: 'post'
    end
  end
end
