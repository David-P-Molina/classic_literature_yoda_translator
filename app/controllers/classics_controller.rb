class ClassicsController < ApplicationController
  before_action :set_classic, only: [:edit, :show]
  before_action :redirect_if_not_logged_in, only: [:new, :create, :edit, :update]
  def index
    @classics = Classic.all
  end
  def show
  end

  def new
    @classic = Classic.new
  end
  
  def create
    @classic = Classic.new(classic_params)
    if @classic.save 
      Api.translate(@classic)
      flash[:message]="Successfully added Classic Literature to the database!"
      redirect_to classic_path(@classic)
    else
      flash[:message]="There was an issue translating your submission. API:Call-Limit Reached"
      redirect_to classics_path
    end
  end

  def edit
    not_the_owner?(@classic)
  end

  def update
    @classic = Classic.find(params[:id])
    if @classic.update(classic_params)
      Api.translate(@classic)
      flash[:message]="Successfully updated Classic Literature piece!"
      redirect_to classics_path
    else
      render :edit
    end
  end
  private
  def set_classic
    @classic = Classic.find(params[:id])
  end
  def classic_params
    params.require(:classic).permit(:category_name, :author_name, :author_id, :category_id, :title, :content, :translation, :release_date)
  end
end
