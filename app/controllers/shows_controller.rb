class ShowsController < ApplicationController

    def new 
        @venue = Venue.find_by_id(params[:venue_id])
    end 

    def create 
        @venue = Venue.find_by_id(params[:venue_id])

        show = Show.new(venue_id: @venue.id, band_id: current_user.band.id)

        if show.save 
            redirect_to band_path(current_user.band)
        else  
            redirect_to new_venue_show_path(@venue)
        end 
    end 
    
  

    def index 
    end 

end
