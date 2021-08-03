class MusiciansController < ApplicationController
    
    def index 
        if current_user.band 
          @musicians = Musician.available(current_user.band.reputation)
        else  
          @musicians = Musician.available(0)
        end 
    end 

    def show 
        @musician = Musician.find_by_id(params[:id])
    end 

end
