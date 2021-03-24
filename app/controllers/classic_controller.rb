class ClassicController < ApplicationController
  before_action :set_classic, only: [:edit, :show]
  
  def index
    @classics = Classic.new
  end
  def show
  end

  def new
    @classic = Classic.new
  end
  def create
    @classic = Classic.new(classic_params)
    if @classic.save
      redirect_to classics_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    @classic = Classic.find(params[:id])
    if @classic.update(classic_params)
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
    params.require(:classic).permit!
  end
end
