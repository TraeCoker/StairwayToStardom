module UsersHelper
    def links_if_no_band
        if current_user.band.try(:id)
            link_to("View #{current_band.name} Dashboard", band_path(current_band))
        else  
            render('users/links')
        end 
    end 
end
