module BandsHelper
    def open_position
        current_band.missing_instrument?[0]
    end 

    def links_if_current_band(band)
        render('links') if band == current_user.band 
    end 
end
