class CategoriesController < ApplicationController
before_action :set_category, only: [:edit, :show]
rescue_from ActiveRecord::RecordNotFound, with: :record_not_found
  def index
    @categories = Category.all
  end
  def show
  end

  private
  def set_category
    @category = Category.find(params[:id])
  end
  def category_params
    params.require(:category).permit(:name, classic_ids: [])
  end
  def record_not_found
    flash[:message] = "The page you were looking for wasn't found!"
    redirect_to categories_path
  end
end
