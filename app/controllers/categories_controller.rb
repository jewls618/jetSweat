class CategoriesController < ApplicationController

  def index
    @location = Location.find(params[:location_id])
    @categories = Category.all
  end
end
