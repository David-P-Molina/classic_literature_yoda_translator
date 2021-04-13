class SessionsController < ApplicationController
    def new
        @user = User.new
    end
    def facebook_login
        @user = User.find_or_create_by(uid: auth['uid']) do |u|
            u.username = auth['info']['name']
            u.email = auth['info']['email']
          end
          session[:user_id] = @user.id
          render 'welcome/home'
    end
    def create
        @user = User.find_by(username: params[:username])
        return head(:forbidden) unless @user.authenticate(params[:password])
        if @user.valid?
            session[:user_id] = @user.id
            render 'welcome/home'
        else
            redirect_to '/login'
        end
    end
    def destroy
        session.delete :username
        redirect_to '/login'
    end
    private
    def auth
        request.env['omniauth.auth']
    end
end
