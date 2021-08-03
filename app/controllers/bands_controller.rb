class BandsController < ApplicationController

    def new 
        @band = Band.new 
    end 

    def create 
        @band = Band.new(band_params)
        @band.user = current_user

        if @band.save 
            @band.recruit_musicians

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
    end 

  private 

    def band_params
        params.require(:band).permit(:name, :genre, :location, :vocalist_id, :drummer_id, :guitarist_id, :bassist_id)
    end 

end
