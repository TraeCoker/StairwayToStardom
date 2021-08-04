class Show < ApplicationRecord
    belongs_to :band 
    belongs_to :venue
    has_one :review 
    before_save :calculate_outcome

  private 
    #practice number
    #reputation
    #mood
    #musician fatigue

    def calculate_outcome
        #band = self.band 
        last_show_time = band.shows.last.created_at

        if band.tier == 1
            if TimeDifference.between(last_show_time, Time.now.utc).in_minutes < 2
                score = 3
            elsif TimeDifference.between(last_show_time, Time.now.utc).in_minutes.between?(3,5)
                score = 2
            else 
                if band.practice_count < 2
                    score = 0
                elsif band.practice_count.between?(3,6)
                    score = 1
                elsif band.practice_count.between?(7,8)
                    score = 2
                elsif band.practice_count > 8
                    score = 3
                end 
            end 

            if band.mood <= 2
                score -= 1
            end 

            if band.reputation == 3
                score += 1
            end 
            score.clamp(0, 4)

            self.build_review(rating: score)

            band.play_show(score)
                

            
        
        end 

    end 

end
