class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.user_id
      redirect_to controller: 'classics', action: 'index'
    else
      #add flash error
      redirect_to controller: 'users', action: 'new'
  end

  def edit
  end
  
  def update
  end

  def show
  end

  private
  def user_params
    params.require(:user).permit(:username, :password, :password_confirmation, :email)
  end
end
