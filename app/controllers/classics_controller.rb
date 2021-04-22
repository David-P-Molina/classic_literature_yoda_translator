class ClassicsController < ApplicationController
  before_action :set_classic, only: [:edit, :show]
  before_action :redirect_if_not_logged_in, only: [:new, :edit]
  def newest_classic
    @classic = Classic.newest_classic
    @modern = Classic.modern_classic
    render classics_newest_classic_path
  end
  def oldest_classic
    @classic = Classic.oldest_classic
    @ancient = Classic.ancient_classic
    render classics_oldest_classic_path
  end

  def index
    @classics = Classic.order(:release_date)
  end


  def show
  end

  def new
    if params[:author_id] && !Author.exists?(params[:author_id])
      @classic = Classic.new
    else
      @classic = Classic.new(author_id: params[:author_id])
    end
  end 
  def create
    @classic = Classic.new(classic_params)
    if @classic.valid? 
      translation_status
    else 
      flash[:alert]="Unable to submit Classic Literature for translation, please try again."
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
    params.require(:classic).permit(:user_id, :category_name, :author_name, :author_id, :category_id, :title, :content, :translation, :release_date, author_attributes: [:name, :biography, :birth, :death, :user_id])
  end
end
