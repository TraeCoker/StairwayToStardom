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
      @musician = Musician.find_by_id(params[:id])
      @musician.update(band_id: current_band.id)
      flash[:message] = "#{musician.name} has joined your band!"

      redirect_to band_path(current_band)
    end 

end
