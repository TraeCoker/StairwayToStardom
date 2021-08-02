module ApplicationHelper
    def current_user
        @current_user ||= User.find_by_id(session[:id])
    end 

    def logged_in?
        !!current_user
    end 
end
