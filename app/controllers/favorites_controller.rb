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
    @workout = Workout.find(params[:workout_id])
    @user = current_user

    @favorite = Favorite.new(user: @user, workout: @workout)

    respond_to do |format|
      if @favorite.save
        format.html { redirect_back fallback_location: :back, notice: 'Workout has been added to favorites!' }
        format.json { render json: :back}
      else
        flash[:notice] = "Workout is already a favorite."
        redirect_back fallback_location: :back
      end
    end
  end

  def destroy
    @favorite = Favorite.find(params[:id])
    @favorite.destroy
    flash[:notice] = 'Removed from favorites.'
    redirect_back fallback_location: :back
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
