module BandsHelper
    def open_position
        current_band.missing_instrument?[0]
    end 
end
