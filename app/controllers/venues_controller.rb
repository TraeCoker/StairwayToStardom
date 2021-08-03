class VenuesController < ApplicationController

    def show 
        @venue = Venue.find_by_id(params[:id])
    end 

    def index 
        @venues = Venue.sort_by_tier(current_user.band.reputation_to_tier)
    end 

end
