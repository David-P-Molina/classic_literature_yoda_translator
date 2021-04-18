class ClassicsController < ApplicationController
  before_action :set_classic, only: [:edit, :show]
  before_action :redirect_if_not_logged_in, only: [:new, :edit]
  def newest_classic
    @classic = Classic.newest_classic
    render classics_newest_classic_path
  end
  def oldest_classic
    @classic = Classic.oldest_classic
    render classics_oldest_classic_path
  end
  def index
    @classics = Classic.order(:release_date)
  end
  def show
  end

  def new
    if params[:author_id] && !Author.exists?(params[:author_id])
      flash[:alert] = "Author not found in Database."
      redirect_to authors_path
    else
      @classic = Classic.new(author_id: params[:author_id])
  end
end 
  def create
    @classic = Classic.new(classic_params)
    if @classic.valid? 
      translation_status
    else #Here if @classic is not valid seperate from valid translation request
      render new_classic_path
    end
  end

  def edit
    not_the_owner?(@classic)
    validate_classic_edit(@classic)
  end

  def update
    @classic = Classic.find(params[:id])
    if @classic.update(classic_params)
      translation_status #redirect handled in translation_status
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
