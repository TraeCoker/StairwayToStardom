class BandsController < ApplicationController
    before_action :redirect_if_not_full_band, only: [:practice]
    def new 
        @band = Band.new 
    end 

    def create 
        @band = Band.new(band_params)
        @band.user = current_user
        @band.recruit_musicians
       

        if @band.valid?
           @band.save   
           @band.reset_ids 
           
            redirect_to band_path(@band)
        else  
            render :new 
        end 
    end 

    def show
        @band = Band.find_by_id(params[:id])

        if !full_band?
            @instrument = @band.missing_instrument?[0]
            flash[:message] = "Your #{@instrument} player has quit the band. You must recruit or create a new member to continue."
        end 
    end 

    def index 
        @genres = Band.all.each.collect{|b| b.genre }.uniq

        if !params[:genre].blank?
            @bands = Band.by_genre(params[:genre])
        else
            @bands = Band.rank_by_reputation
        end 
    end 

    def edit
    end 

    def update 
    end 

    def destroy 
        @band = Band.find_by_id(params[:id])
        @band.destroy 

        redirect_to user_path(current_user)
    end 
        

    def practice
        @band = Band.find_by_id(params[:band_id])

        @band.increment!(:practice_count, 1)
        @band.save 

        render :show
    end 

  private 

    def band_params
        params.require(:band).permit(:name, :genre, :location, :vocalist_id, :drummer_id, :guitarist_id, :bassist_id, musicians_attributes: [:name, :instrument])
    end 

    def missing_instrument?
        instrument = []

        if !self.musicians.vocals 
            instrument << :vocals 
        end 
        if !self.musicians.guitar 
            instrument << :guitar
        end  
        if !self.musicians.drums 
            instrument << :drums 
        end 
        if !self.musicians.bass 
            isntrument << :bass 
        end 
        if instrument == []
            false 
        else  
            instrument 
        end 
    end 

end
