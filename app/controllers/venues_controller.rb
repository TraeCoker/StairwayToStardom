class VenuesController < ApplicationController
    before_action :redirect_if_not_full_band

    def show 
        @venue = Venue.find_by_id(params[:id])
    end 

    def index 
        @venues = Venue.sort_by_tier(current_user.band.tier)
    end 

end
