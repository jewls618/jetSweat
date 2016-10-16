class LocationsController < ApplicationController

  def index
    @locations = Location.all.sort_by { |l| l.city }
  end

  def show
    @location = Location.find(params[:id])
  end
end
