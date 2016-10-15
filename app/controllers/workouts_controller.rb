class WorkoutsController < ApplicationController

  def index
    @workouts = Workout.all
  end

  def show
    @location = Location.find(params[:location_id])
    @workout = Workout.find(params[:id])
  end
end
