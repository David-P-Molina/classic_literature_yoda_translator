class ClassicsController < ApplicationController
  before_action :set_classic, only: [:edit, :show]
  before_action :redirect_if_not_logged_in, only: [:new, :edit]
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
    if @classic.valid? 
      translation_status
    else #Here if @classic is not valid seperate from valid translation request
      render :new
    end
  end

  def edit
    not_the_owner?(@classic)
  end

  def update
    @classic = Classic.find(params[:id])
    if @classic.update(classic_params)
      translation_status
    end
  end
  private
  def set_classic
    @classic = Classic.find(params[:id])
  end
  def classic_params
    params.require(:classic).permit(:user_id, :category_name, :author_name, :author_id, :category_id, :title, :content, :translation, :release_date)
  end
end
