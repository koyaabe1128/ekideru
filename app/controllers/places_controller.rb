class PlacesController < ApplicationController
  def index
  end
  
  def search
  end
  
  def building
    @places = Place.where(kind:0).order(:yomigana)
  end
  
  def landmark
    @places = Place.where(kind:1).order(:yomigana)
  end

  def show
    @place = Place.find(params[:id])
  end
end
