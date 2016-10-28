class WorkoutsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def index
    all_workouts
    @google_results = google_maps_array

    if params[:search].present?
      @all_workouts = @location.workouts.where(category: @category).search(params[:search])
    end
  end

  def show
    @location = Location.find(params[:location_id])
    @category = Category.find(params[:category_id])
    @workout = Workout.find(params[:id])
    @favorite = Favorite.new
    @comment = Comment.new
    @comments = @workout.comments
    @place_id = @workout.place_id

    params = {
      term: @workout.name,
      category_filter: ("fitness"),
      limit: 1
    }
    @yelp_data = Yelp.client.search(@workout.street, params)

    if @place_id
      uri = URI("https://maps.googleapis.com/maps/api/place/details/json?placeid=#{@place_id}&key=#{ENV['GOOGLE_PLACES_DETAILS_API']}")
      response = Net::HTTP.get_response(uri)
      @place_details = JSON.parse(response.body)

      if @place_details["result"]["reviews"]
        @reviews = @place_details["result"]["reviews"]
      end


    if @place_details["result"]["photos"]
      @picture_reference = @place_details["result"]["photos"][0]["photo_reference"]
      @uri = URI("https://maps.googleapis.com/maps/api/place/photo?maxwidth=400&photoreference=#{@picture_reference}&key=#{ENV['GOOGLE_PLACES_PHOTOS_API']}")
    end
  end
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
    flash[:notice] = 'Workout deleted.'
    redirect_to location_category_workouts_path
  end

  def edit
    @location = Location.find(params[:location_id])
    @category = Category.find(params[:category_id])
    @workout = Workout.find(params[:id])
  end

  def update
    @location = Location.find(params[:location_id])
    @category = Category.find(params[:category_id])
    @workout = Workout.find(params[:id])
    if @workout.update_attributes(workout_params)
      redirect_to location_category_workout_path(@location.id, @category.id, @workout.id)
    end
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

  def get_google_data(category, location)
    uri = URI("https://maps.googleapis.com/maps/api/place/textsearch/json?query=#{category}+in+#{location}&key=#{ENV['GOOGLE_PLACES_API']}")
    response = Net::HTTP.get_response(uri)
    JSON.parse(response.body)
  end

  def new_workout(workout, location, category)
    workout_objects = []
    workout["results"].each do |w|
      workout_objects << Workout.find_or_create_by(name: w["name"], street: w["formatted_address"], latitude: w["geometry"]["location"]["lat"], longitude: w["geometry"]["location"]["lng"], location_id: location, category_id: category, place_id: w["place_id"] )
    end
    return workout_objects
  end

  def all_workouts
    @location = Location.find(params[:location_id])
    @category = Category.find(params[:category_id])
    @workouts = get_google_data(@category.category, @location.city)
    @workout = new_workout(@workouts, @location.id, @category.id)
    @all_workouts = Workout.all.where(location_id: @location.id, category_id: @category.id)
  end

  def google_maps_array
    @google_maps_array = Array.new
    all_workouts

    @workout.each do |workout|
      @google_maps_array << {
        title: workout.name,
        id: workout.id,
        cat_id: workout.category.id,
        loc_id: workout.location.id,
        location: {
          lat: workout.latitude.to_f,
          lng: workout.longitude.to_f
        }
      }
    end
    return @google_maps_array
  end
end
