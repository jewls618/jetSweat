class WorkoutsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @location = Location.find(params[:location_id])
    @category = Category.find(params[:category_id])
    @workouts = get_data(@category.category, @location.city)
    @workout = new_workout(@workouts, @location.id, @category.id)
    @all_workouts = Workout.all.where(location_id: @location.id, category_id: @category.id)
  end

  def show
    @location = Location.find(params[:location_id])
    @category = Category.find(params[:category_id])
    @workout = Workout.find(params[:id])
  end

  def new
    @workout = Workout.new
    @location = Location.find(params[:location_id])
    @category = Category.find(params[:category_id])
  end

  def destroy
    @location = Location.find(params[:location_id])
    @category = Category.find(params[:category_id])
    @workout = Workout.find(params[:id])
    @workout.destroy
    flash[:notice] = 'Workout deleted'
    redirect_to location_category_workouts_path(@location.id, @category.id)
  end

  def create
    @workout = Workout.new(workout_params)
    @location = Location.find(params[:location_id])
    @category = Category.find(params[:category_id])

    @workout.category_id = @category.id
    @workout.location_id = @location.id

    if @workout.save
      redirect_to location_category_workouts_path
      flash[:success] = "Workout has been added successfully."
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
      workout_objects << Workout.find_or_create_by(name: w["name"], street: w["formatted_address"], location_id: location, category_id: category)
    end
    return workout_objects
  end
end
