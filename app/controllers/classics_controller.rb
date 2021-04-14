class ClassicsController < ApplicationController
  before_action :set_classic, only: [:edit, :show]
  
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
      #Api.translate(@classic)
      flash[:message]="Successfully added Classic Literature to the database!"
      redirect_to classic_path(@classic)
    else
      render :new
    end
  end

  def edit
  end

  def update
    @classic = Classic.find(params[:id])
    if @classic.update(classic_params)
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
