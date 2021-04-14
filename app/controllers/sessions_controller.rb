class SessionsController < ApplicationController
    def new
    end
    def facebook_login
        @user = User.find_or_create_by(uid: auth['uid']) do |u|
            u.username = auth['info']['name']
            u.email = auth['info']['email']
          end
          session[:user_id] = @user.id
          render '/'
    end
    def create
        @user = User.find_by(email: params[:user][:email])
        if @user && @user.authenticate(params[:user][:password])
            session[:user_id] = @user.id
            redirect_to '/'
        else
            flash[:message] = "Credentials are invalid, Please log in again."
            render :new
        end
    end
    def destroy
        session.delete :user_id
        flash[:message] = "Successfully Logged Out!"
        redirect_to '/login'
    end
    private
    def auth
        request.env['omniauth.auth']
    end
end
