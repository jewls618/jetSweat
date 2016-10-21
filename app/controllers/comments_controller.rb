class CommentsController < ApplicationController
  before_action :authenticate_user!
  
  def new
    @workout = Workout.find(params[:workout_id])
    @comment = Comment.new
  end

  def create
    @workout = Workout.find(params[:workout_id])
    @comment = Comment.new(comment_params)
    @comment.workout = @workout
    @comment.user_id = current_user.id
    @location = @comment.workout.location
    @category = @comment.workout.category

    if @comment.save
      flash[:success] = "Comment added successfully!"
      redirect_to location_category_workout_path(@location.id, @category.id, @workout.id)
    else
      @comment.errors.any?
      flash[:notice] = @comment.errors.full_messages.join(", ")
      render :new
    end
  end

  def destroy
    @workout = Workout.find(params[:workout_id])
    @comment = @workout.comments.find(params[:id])
    @comment.destroy
    @location = @comment.workout.location
    @category = @comment.workout.category
    flash[:notice] = 'Comment deleted.'
    redirect_to location_category_workout_path(@location.id, @category.id, @workout.id)
  end

  def edit
    @workout = Workout.find(params[:workout_id])
    @comment = @workout.comments.find(params[:id])
  end

  def update
    @workout = Workout.find(params[:workout_id])
    @comment = @workout.comments.find(params[:id])
    @location = @comment.workout.location
    @category = @comment.workout.category
    if @comment.update_attributes(comment_params)
      flash[:notice] = 'Comment updated.'
      redirect_to location_category_workout_path(@location.id, @category.id, @workout.id)
    else
      render :edit
    end
  end

  protected

  def comment_params
    params.require(:comment).permit(:body, :user_id, :workout_id)
  end
end
