class CategoriesController < ApplicationController

  def index
    @location = Location.find(params[:location_id])
    @categories = Category.find_by(location: @location.name)
  end
end
