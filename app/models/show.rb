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
        if band.tier == 1

            if band.shows.last 
               score = time_since_last_show(band.shows.last.created_at)
            end 

            if band.practice_count < 2 && !time_since_last_show(band.shows.last.created_at)
                score = 0
            elsif band.practice_count.between?(3,6)
                score += 1
            elsif band.practice_count.between?(7,8)
                score += 2
            elsif band.practice_count > 8
                score += 3
            end

            if band.mood <= 2
                score -= rand(1)
            elsif band.mood > 3
                score += rand(1)
            end 

            if band.reputation == 3
                score += 1
            end 

            
            self.build_review(rating: score.clamp(0, 4))

            band.play_show(score)
            
        end 
     end 

     def time_since_last_show(last_show_time)
        if TimeDifference.between(last_show_time, Time.now.utc).in_minutes < 2
            3
         elsif TimeDifference.between(last_show_time, Time.now.utc).in_minutes.between?(3,5)
            2
        end
    end 

end
