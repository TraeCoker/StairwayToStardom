class VenuesController < ApplicationController
    before_action :redirect_if_not_full_band
    before_action :redirect_if_not_logged_in

    def show 
        @venue = Venue.find_by_id(params[:id])
        @shows = @venue.shows.last(5)
    end 

    def index 
        @venues = Venue.sort_by_tier(current_user.band.tier)
    end 

end
