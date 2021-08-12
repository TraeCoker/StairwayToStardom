class ApplicationController < ActionController::Base
    include ApplicationHelper

    private 
        def redirect_if_not_logged_in
            if !logged_in?
                flash[:message] = "Please log in to continue."
                redirect_to login_path
            end 
        end 

        def redirect_if_no_band
            if !current_band
              redirect_to new_band_path
            end 
          end 
        
end
