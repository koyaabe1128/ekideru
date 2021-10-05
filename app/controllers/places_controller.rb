class PlacesController < ApplicationController
  def index
  end
  
  def search
  end
  
  def destination
    @places = Place.all.order(:yomigana)
  end
  
  def exit
  end

  def show
    @place = Place.find(params[:id])
  end
end
