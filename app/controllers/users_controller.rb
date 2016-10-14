class UsersController < ApplicationController
  # before_action :authorize_user

  def show
    @user = User.find(params[:id])
  end
end
