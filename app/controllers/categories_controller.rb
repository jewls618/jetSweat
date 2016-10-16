class CategoriesController < ApplicationController

  def index
    @categories = Category.all.sort_by { |c| c.category }
  end
end
