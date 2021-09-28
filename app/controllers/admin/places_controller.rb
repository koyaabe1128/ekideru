class Admin::PlacesController < ApplicationController
  before_action :if_not_admin

  def index
  end
  
  def new
    @user = Place.new
  end
  
  def create
    @place = Place.new(place_params)
    if @place.save
      redirect_to admin_place_path(@place)
    else
      redirect_to new_admin_place_path
    end
  end
  
  def show
    @place = Place.find(params[:id])
  end
  
  def edit
  end
  
  def update
  end
  
  def destroy
  end

  private
  
  def if_not_admin
    redirect_to root_path unless current_user.admin?
  end
  
  def place_params
    params.permit(:name, :yomigana, :image, :kind, :exit_num)
  end
  
end
