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
        user = User.from_omniauth(auth)

        if user.valid?
            session[:user_id] = user.id 
            redirect_to user_path(user)
        else  
            redirect_to '/auth/google_oauth2'
        end 
    end 

    def destroy 
    end 

end 