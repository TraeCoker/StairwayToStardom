class Review < ApplicationRecord
    belongs_to :show 
    after_initialize :check_for_drama

        #def report_departure(musician_name)
         #   self.update(headline: "#{musician_name} leaves #{self.show.band.name}. What will they do now?")
        #end 

    private 
        def check_for_drama
            if self.show.final_show_for != nil 
                self.headline = "#{self.show.final_show_for} leaves #{self.show.band.name}. What will they do now?"
            else   
                generate_content
            end 
        end 

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
                    if self.show.promoted == true 
                        self.headline = "#{self.show.band.musicians.vocals.first.name} casts a spell on #{self.show.venue.name}. #{self.show.band.name} is here to conquer #{self.show.band.genre} music."
                    else  
                        self.headline = "Wow! #{self.show.band.name} gives a KILLER performance! #{self.show.band.genre} is not dead!"
                    end 
                end 
            end 
        end 

        
end
