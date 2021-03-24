class AuthorsController < ApplicationController
  before_action :set_author, only: [:show, :edit]
  def index
    @authors = Author.all
  end
  
  def show
  end

  def new
    @author = Author.new
  end

  def create
    @author = Author.new(author_params)
    if @author.save
      redirect_to authors_path
    else 
      render :new
    end
  end

  def edit
  end

  def update
    @author =Author.find(params[:id])
    if @author.update(author_params)
      redirect_to authors_path
    else 
      render :edit
    end
  end
  private
  def set_author
    @author = Author.find(params[:id])
  end
  def author_params
    params.require(:author).permit(:name, classics_id: [])
  end
end
