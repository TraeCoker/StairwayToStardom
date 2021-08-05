class Review < ApplicationRecord
    belongs_to :show 
    after_initialize :generate_content

    private 

        def generate_content 
            self.headline = "Wow #{self.show.band.name} was great! #{self.show.band.genre} is not dead!"
        end 
end
