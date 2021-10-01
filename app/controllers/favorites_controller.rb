class FavoritesController < ApplicationController
  def create
    @place = Place.find(params[:place_id])
    favorite = current_user.favorites.build(place_id: @place.id)
    favorite.save
    redirect_to @place
  end
  
  def destroy
    @place = Place.find(params[:id])
    favorite = current_user.favorites.find_by(place_id: @place.id)
    favorite.destroy
    redirect_back(fallback_location: root_path)
  end
end
