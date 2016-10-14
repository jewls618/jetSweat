class LocationsController < ApplicationController

  def index
    @locations = Location.all
  end

  def show
    @location = User.find(params[:id])
  end
end
