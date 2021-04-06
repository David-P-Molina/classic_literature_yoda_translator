class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to '/classics/index'
    else
      #add flash error
      redirect_to controller: 'users', action: 'new'
    end
  end

  # def edit
  #   @user = User.find(params[:id])
  # end
  
  # def update
  #   @user = User.find(params[:id])
  #   if @user.update

  #   end
  # end

  def show
  end

  private
  def user_params
    params.require(:user).permit(:username, :password, :password_confirmation, :email)
  end
end
