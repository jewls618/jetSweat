class WorkoutsController < ApplicationController

  def index
    @location = Location.find(params[:location_id])
    @category = Category.find(params[:category_id])
    @workouts = Workout.where(location: @location.id, category: @category.id)
  end

  def show
    @location = Location.find(params[:location_id])
    @workout = Workout.find(params[:id])
  end

  private

  def workout_params
    params.require(:workout).permit()
  end

    def district_params
      params.require(:district).permit(:name, :category_id, :hours, :price, :location_id, :street, :zip, :phone)
   end
end
