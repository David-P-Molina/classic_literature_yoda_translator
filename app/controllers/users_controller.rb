class UsersController < ApplicationController
  def new
  end

  def create
    User.create(user_params)
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
