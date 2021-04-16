class SessionsController < ApplicationController
    def new
    end
    def facebook_login
        @user = User.find_or_create_by(uid: auth['uid']) do |u|
            u.username = auth['info']['name']
            u.email = auth['info']['email']
            u.password = SecureRandom.base64(10)
        end
        
        if @user.valid?
            session[:user_id] = @user.id
            flash[:message] = "Login with Facebook account was successful!"
            redirect_to root_path
        else
            flash[:message] = "We encountered a problem logging in with Facebook, Please try again."
            render :new
        end
    end
    def create
        @user = User.find_by(email: params[:user][:email])
        if @user && @user.authenticate(params[:user][:password])
            session[:user_id] = @user.id
            redirect_to root_path
        else
            flash[:message] = "Credentials are invalid, Please log in again."
            render new_user_path
        end
    end
    def destroy
        session.delete :user_id
        flash[:message] = "Successfully Logged Out!"
        redirect_to login_path
    end
    private
    def auth
        request.env['omniauth.auth']
    end
end
