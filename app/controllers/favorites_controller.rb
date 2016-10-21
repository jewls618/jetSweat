class FavoritesController < ApplicationController
  before_action :authorize_user

  def index
    @user = current_user
    @favorites = @user.favorites
  end

  def new
    @favorite = Favorite.new
    @user = current_user
    @workout = Workout.find(params[:workout])
  end

  def create
    @favorite = Favorite.new(fav_params)
    @workout = Workout.find(params[:workout_id])
    @user = current_user
    params[:user_id] = @user.id

    @favorite.workout_id = @workout.id
    @favorite.user_id = @user.id

    @category = @favorite.workout.category

    if @favorite.save
      flash[:notice] = "Workout has been added to favorites."
      redirect_back fallback_location: :back
    else
      flash[:notice] = "Workout is already a favorite."
      redirect_back fallback_location: :back
    end
  end

  protected

  def fav_params
    params.require(:favorite).permit(:workout_id, :user_id)
  end

  def authorize_user
    unless user_signed_in?
      raise ActionController::RoutingError.new("STOP...appreciate and listen...")
    end
  end
end
