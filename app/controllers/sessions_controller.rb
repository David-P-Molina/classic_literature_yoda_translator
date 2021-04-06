class SessionsController < ApplicationController
    def new
    end
    def create
        @user = User.find_by(username: params[:username])
        return head(:forbidden) unless @user.authenticate(params[:password])
        if @user.valid?
            session[:user_id] = @user.id
        else
            redirect_to '/login'
        end
    end
    def destroy
        session.delete :username
        redirect_to '/login'
    end
end
