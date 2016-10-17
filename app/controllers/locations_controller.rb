class LocationsController < ApplicationController

  def index
    @locations = Location.all.sort_by { |l| l.city }
    @location = Location.new
  end

  def show
    @location = Location.find(params[:id])
  end

  def new
    @location = Location.new
  end

  def create
    @location = Location.new(location_params)

    if @location.save
      redirect_to location_categories_path(@location)
    else
      render :index
    end
  end

  def location_params
    params.require(:location).permit(:city)
  end
end
