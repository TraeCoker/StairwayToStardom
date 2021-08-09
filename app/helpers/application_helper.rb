module ApplicationHelper
    def current_user
        @current_user ||= User.find_by_id(session[:user_id])
    end 

    def logged_in?
        !!current_user
    end 

    def current_band
        current_user.band
    end 

    def full_band?
        current_user.band.musicians.count == 4
    end 

    def redirect_if_not_full_band
        if !full_band?
            flash[:message] = "Must have full band."
            if current_band
                redirect_to band_path(current_band)
            else  
                redirect_to user_path(current_user)
            end 
        end 
    end 

end
