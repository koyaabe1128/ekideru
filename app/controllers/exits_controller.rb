class ExitsController < ApplicationController
  def index
    @exits = Exit.all
  end
  
  def show
    @exit = Exit.find(params[:id])
  end
end
