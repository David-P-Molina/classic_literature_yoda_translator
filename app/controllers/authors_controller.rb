class AuthorsController < ApplicationController
  before_action :set_author, only: [:show, :edit]
  before_action :redirect_if_not_logged_in, only: [:new, :edit]
  def index
    @authors = Author.all.includes(:classics)
  end
  def show
  end

  def new
    @author = Author.new
  end
  def create
    @author = Author.new(author_params)
    if @author.save
      flash[:message]="Successfully added Author to the database!"
      redirect_to authors_path
    else 
      flash[:alert]="Unable to add Author to the database."
      render new_author_path
    end
  end

  def edit
    !not_the_owner?(@author)
  end
  def update
    @author =Author.find(params[:id])
    if @author.update(author_params)
      flash[:message]="Successfully updated Author's information!"
      redirect_to authors_path
    else 
      flash[:alert]="Unable to update Author's information!"
      render :edit
    end
  end
  
  private
  def set_author
    @author = Author.find(params[:id])
  end
  def author_params
    params.require(:author).permit(:user_id, :name, :biography, :death, :birth)
  end
end
