class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      flash[:message]="Account has been created successfully, You are now logged!"
      redirect_to root_path
    else
      flash[:alert]="Unable to Signup please try again."
      render new_user_path
    end
  end
  
  private
  def user_params
    params.require(:user).permit(:username, :password, :password_confirmation, :email)
  end
end
