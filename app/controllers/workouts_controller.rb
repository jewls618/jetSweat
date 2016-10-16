class WorkoutsController < ApplicationController

  def index
    @location = Location.find(params[:location_id])
    @category = Category.find(params[:category_id])
    @workouts = Workout.where(location: @location.city, category: @category.category)
  end

  def show
    @location = Location.find(params[:location_id])
    @workout = Workout.find(params[:id])
  end
end
