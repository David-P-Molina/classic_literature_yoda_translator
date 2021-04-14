class CategoriesController < ApplicationController
  before_action :set_category, only: [:edit, :show]
  def index
    @categories = Category.all
  end
  def show
  end
  # def new
  #     @category = Category.new
  # end
  # def create
  #   @category = Category.new(category_params)
  #   if @category.save
  #     redirect_to categories_path
  #   else
  #     render :new
  #   end
  # end

  # def edit
  # end
  # def update
  #   @category = Category.find(params[:id])
  #   if @category.update(category_params)
  #     redirect_to category_path
  #   else
  #     render :edit
  #   end
  # end
  private
  def set_category
    @category = Category.find(params[:id])
  end
  def category_params
    params.require(:category).permit(:name, classic_ids: [])
  end
end
