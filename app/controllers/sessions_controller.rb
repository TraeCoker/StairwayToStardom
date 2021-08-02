class SessionsController < ApplicationController
    
    def new 
    end 

    def create 
        user = User.find_by_email(params[:user][:email])

        if user && user.authenticate(params[:user][:password])
            session[:user_id] = user.id 
            redirect_to user_path(user)
        else  
            flash[:message] = "Invalid email or password. Please try again."
            redirect_to login_path
        end 
    end 

    def omniauth
    end 

    def destroy 
    end 

end 