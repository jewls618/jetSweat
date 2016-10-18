class WorkoutsController < ApplicationController

  def index
    @location = Location.find(params[:location_id])
    @category = Category.find(params[:category_id])
    @workouts = get_data(@category.category, @location.city)
    @workout = new_workout(@workouts, @location.id, @category.id)
  end

  def show
    @location = Location.find(params[:location_id])
    @category = Category.find(params[:category_id])
    @workout = Workout.find(params[:id])
  end

  private

  def workout_params
    params.require(:workout).permit()
  end

  def get_data(category, location)
    uri = URI("https://maps.googleapis.com/maps/api/place/textsearch/json?query=#{category}+in+#{location}&key=#{ENV['GOOGLE_PLACES_API']}")
    response = Net::HTTP.get_response(uri)
    JSON.parse(response.body)
  end

  def new_workout(workout, location, category)
    workout_objects = []
    workout["results"].each do |w|
      workout_objects << Workout.create(name: w["name"], street: w["formatted_address"], rating: w["rating"], location_id: location, category_id: category)
    end
    return workout_objects
  end
end
