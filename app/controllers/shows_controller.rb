class ShowsController < ApplicationController
    before_action :assess_musicians_fatigue, only: [:new]
    before_action :redirect_if_not_full_band
    before_action :redirect_if_not_logged_in

    def new 
        @venue = Venue.find_by_id(params[:venue_id])

        @show = Show.new 
    end 

    def create 

        @venue = Venue.find_by_id(params[:venue_id])
    
        if show_was_promoted
            show = Show.new(venue_id: @venue.id, band_id: current_user.band.id, promoted: true)
        else 
            show = Show.new(venue_id: @venue.id, band_id: current_user.band.id)
        end 

        if show.save 
            redirect_to show_review_path(show, show.review)
        else  
            redirect_to new_venue_show_path(@venue)
        end 
    end 
    
  

    def index 
    end 

    private 

    def assess_musicians_fatigue
        current_user.band.assess_fatigue
    end 

    def show_was_promoted
        params[:show] && params[:show][:promoted] == "1"
    end 

end
