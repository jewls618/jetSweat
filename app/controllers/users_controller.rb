class UsersController < ApplicationController
  before_action :authorize_user, except: [:show]

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def authorize_user
    if !user_signed_in? || !current_user.admin?
      redirect_to root_path
      flash[:notice] = "You do not have access to this page."
    end
  end
end
