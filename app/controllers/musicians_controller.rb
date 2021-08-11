class MusiciansController < ApplicationController
    
    def index 
      if !params[:instrument].blank? 
        @musicians = Musician.filter_by_instrument(params[:instrument])
      else  
        @musicians = Musician.rank_by_reputation
      end 
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

    def new 
      @musician = Musician.new
    end 
    
    def create 
      @musician = current_band.musicians.build(musician_params)
      @musician.instrument = current_band.missing_instrument?[0]


      if @musician.valid?
        @musician.save 

        flash[:message] = "#{@musician.name} has joined your band!"
        redirect_to band_path(current_band)
      else  
        render :new 
      end 
    end 

    def update 
      @musician = Musician.find_by_id(params[:id])
      @musician.update(band_id: current_band.id)
      flash[:message] = "#{@musician.name} has joined your band!"

      redirect_to band_path(current_band)
    end 

    private 

    def musician_params 
      params.require(:musician).permit(:name)
    end 
end
