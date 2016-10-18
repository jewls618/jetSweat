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

  def create
    @workout = Workout.new(workout_params)

    if @wokrout.save
      redirect_to location_category_workouts_path
      flash[:success] = "Workout added successfully"
    else
      @workout.errors.any?
      flash[:notice] = @workout.errors.full_messages.join(", ")
      render :new
    end
  end

  private

  def workout_params
    params.require(:workout).permit(:name, :category_id, :hours, :price, :location_id, :street, :phone, :rating)
  end

  def get_data(category, location)
    uri = URI("https://maps.googleapis.com/maps/api/place/textsearch/json?query=#{category}+in+#{location}&key=#{ENV['GOOGLE_PLACES_API']}")
    response = Net::HTTP.get_response(uri)
    JSON.parse(response.body)
  end

  def new_workout(workout, location, category)
    workout_objects = []
    workout["results"].each do |w|
      workout_objects << Workout.create(name: w["name"], street: w["formatted_address"], location_id: location, category_id: category)
    end
    return workout_objects
  end
end
