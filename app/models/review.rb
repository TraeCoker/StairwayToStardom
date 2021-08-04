class Review < ApplicationRecord
    belongs_to :show 
    after_initialize :generate_content

    private 

        def generate_content 
            self.headline = "Wow"
            self.rating = 4
        end 
end
