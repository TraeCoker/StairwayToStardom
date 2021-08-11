module ShowsHelper
    def offer_promotion?
        current_band.shows.count != 0 && current_band.shows.count % 20 == 0 
    end 
end
