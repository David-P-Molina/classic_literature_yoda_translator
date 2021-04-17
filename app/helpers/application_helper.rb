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
    def not_the_owner?(object)
        if !owner(object)
        flash[:message] = "You do not have permission to edit this information!"
        redirect_to root_path
        end
    end
    def owner(object)
        current_user.id == object.user_id
    end
end
