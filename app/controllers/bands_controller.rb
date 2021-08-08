class BandsController < ApplicationController

    def new 
        @band = Band.new 
    end 

    def create 
        @band = Band.new(band_params)
        @band.user = current_user
        @band.recruit_musicians
       

        if @band.valid?
           @band.save   
           
            redirect_to band_path(@band)
        else  
            render :new 
        end 
    end 

    def show
        @band = Band.find_by_id(params[:id])
    end 

    def index 
        @bands = Band.rank_by_reputation
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

   # def recruited_musicians_params
    #    params.require(:band).permit(:vocalist_id, :drummer_id, :guitarist_id, :bassist_id)
    #end 

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
