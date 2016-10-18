class WorkoutsController < ApplicationController

  def index
    @location = Location.find(params[:location_id])
    @category = Category.find(params[:category_id])
    # @workouts = Workout.where(location: @location.id, category: @category.id)
    @workouts = get_data(@category.category, @location.city)
  end

  def show
    @location = Location.find(params[:location_id])
    @category = Category.find(params[:category_id])
    # @workout = Workout.find(params[:id])
    @workouts = get_data(@category.category, @location.city)

    @workout = @workouts.each { |w| puts w }
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
end
