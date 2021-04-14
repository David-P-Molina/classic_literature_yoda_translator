module ApplicationHelper
    def current_user
        @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
    end    
    def logged_in?
        !!current_user
    end
    def redirect_if_not_logged_in
        if !logged_in?
            flash[:message] = "You need to Login/Signup before accessing this feature!"
            redirect_to login_path
        end
    end
end
