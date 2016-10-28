class PagesController < ApplicationController

  def show
    if
      render template: "pages/#{params[:page]}"
    end
  end
end
