class Admin::PlacesController < ApplicationController
  before_action :if_not_admin

  def index
  end
  
  def destination
    @places = Place.all.order(:yomigana)
  end
  
  def new
    @user = Place.new
  end
  
  def create
    @place = Place.new(place_params)
    if @place.save
      redirect_to list_admin_places_path
    else
      redirect_to new_admin_place_path
    end
  end
  
  def edit
    @place = Place.find(params[:id])
  end
  
  def update
    @place = Place.find(params[:id])
    
    if @place.update(place_params)
      redirect_to list_admin_places_path
    else
      render :edit
    end
  end
  
  def destroy
  end

  private
  
  def if_not_admin
    redirect_to root_path unless current_user.admin?
  end
  
  def place_params
    params.permit(:name, :yomigana, :image, :exit_num)
  end
  
end
