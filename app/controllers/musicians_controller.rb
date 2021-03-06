class MusiciansController < ApplicationController
  before_action :redirect_if_not_logged_in
  before_action :redirect_if_no_band, only: [:show, :index]
    
    
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
        @musicians = Musician.available(1)
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
        current_band.update_reputation

        flash[:message] = "#{@musician.name} has joined your band!"
        redirect_to band_path(current_band)
      else  
        render :new 
      end 
    end 

    def update 
      @musician = Musician.find_by_id(params[:id])
      @musician.update(band_id: current_band.id)
      current_band.update_reputation

      flash[:message] = "#{@musician.name} has joined your band!"

      redirect_to band_path(current_band)
    end 

    private 

    def musician_params 
      params.require(:musician).permit(:name)
    end 

end
