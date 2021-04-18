class CategoriesController < ApplicationController
before_action :set_category, only: [:edit, :show]
  def index
    @categories = Category.order(:name)
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
end
