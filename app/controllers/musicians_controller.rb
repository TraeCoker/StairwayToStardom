class MusiciansController < ApplicationController
    
    def index 
        @musicians = Musician.all 
    end 

    def show 
        @musician = Musician.find_by_id(params[:id])
    end 

    def available
      if current_user.band 
        @musicians = Musician.available(current_user.band.reputation, current_user.band.missing_instrument?[0])
      else  
        @musicians = Musician.available(0)
      end 

      render :index
    end 

    def update 
      byebug
    end 

end
