module VenuesHelper
    def band_recently_played_here(venue)
        count = current_band.shows.count - 2
        current_band.shows.last.venue == venue || current_band.shows[count].venue == venue 
    end 
end
