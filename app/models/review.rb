class Review < ApplicationRecord
    belongs_to :show 
    after_initialize :generate_content

    private 

        def generate_content 
            if self.show.band.tier == 1 
                if self.rating == 0
                    self.headline = "#{self.show.band.name} totally bombs it at #{self.show.venue.name}...you could hardly call it music...Do these guys even practice?"
                elsif self.rating == 1 
                    self.headline = "An underwhelming performance by #{self.show.band.name} tonight. Up and coming, but far from cohesive."
                elsif self.rating == 2
                    self.headline = "#{self.show.venue.name} welcomes #{self.show.band.name}. Even gets a toe tap or two."
                elsif self.rating == 3
                    self.headline = "#{self.show.band.name} left the crowd at #{self.show.venue.name} wanting more! Keep a look out for the new sound on the block!"
                elsif self.rating == 4
                    self.headline = "Wow! #{self.show.band.name} gives a KILLER performance! #{self.show.band.genre} is not dead!"
                end 
            end 
        end 
end
