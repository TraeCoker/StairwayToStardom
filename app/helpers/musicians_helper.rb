module MusiciansHelper

    def recruit_if_looking(musician)
        if !full_band? && open_position == musician.instrument 
            link_to("Recruit #{musician.name}" , musician_path(musician), method: :put)
        end 
    end 
end
