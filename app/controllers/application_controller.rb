class ApplicationController < ActionController::Base
    include ApplicationHelper

    private 
        def redirect_if_not_logged_in
            flash[:message] = "Please log in to continue."
            redirect_to login_path if !logged_in?
        end 
end
