class Band < ApplicationRecord
    belongs_to :user 
    has_many :musicians 
    has_many :shows 
    has_many :reviews, through: :shows 
    validates :name, presence: true, uniqueness: true
    validates :genre, :location, presence: true 
    accepts_nested_attributes_for :musicians, reject_if: proc {|attributes| attributes["name"].blank?}
    after_initialize :set_defaults
    before_destroy :disband
    include ActiveModel::Validations
    validates_with MusiciansValidator

   #def rollcall
    #member_count = 0
     #   if !missing_vocals?
      #      member_count += 1
       # end 
        #if !missing_guitarist? 
         #   member_count += 1
       # end 
        #if !missing_drummer? 
         #   member_count += 1 
        #end 
        #if !missing_bassist?
         #   member_count += 1
        #end 

       # member_count += self.musicians.count 
       # member_count == 4
   #end 

    def recruit_musicians 
        recruit_ids = [vocalist_id, drummer_id, guitarist_id, bassist_id].reject(&:nil?)
        recruit_ids.each do |id|
                musician = Musician.find_by_id(id)
                self.musicians << musician 
        end 
    end   

    #def recruit
     #   lineup = self.musicians.all.collect{|m| m.instrument}
      #  recruit_ids = [vocalist_id, drummer_id, guitarist_id, bassist_id].reject(&:nil?)
       # recruit_ids.each do |id|
        #        musician = Musician.find_by_id(id)
         #       instrument = musician.instrument
          #      musician.update(band_id: self.id) if !lineup.include?(instrument)
        #end   
    #end 

    #def undo_recruitment
     #   self.musicians.all do |m|
      #      m.update(band_id: nil)
       # end 
    # end 

    def reputation_to_tier
        if self.reputation.between?(4,6)
           self.update(tier: 2)
        elsif  self.reputation.between?(7,9)
            self.update(tier: 3)
        elsif self.reputation == 10
            self.update(tier: 4)
        end 
    end 

    def set_defaults
        self.reputation ||= 0
        self.practice_count ||= 0
        self.total_shows ||= 0
        self.mood ||= 4
        self.tier ||= 1
    end 

    def reset_ids
        self.update(vocalist_id: nil, guitarist_id: nil, bassist_id: nil, drummer_id: nil)
    end 
      

    def self.rank_by_reputation
        self.order("reputation")
    end 

    def play_show(review_rating)
        if review_rating > 2
            count = rand(3..4)
            self.increment(:total_shows)
            self.update(mood: count, practice_count: 0)
        elsif review_rating.between?(1,2)
            count = rand(1..2)
            self.increment(:total_shows)
            self.update(mood: count, practice_count: 0)
        elsif review_rating == 0
            self.increment(:total_shows)
            self.update(mood: 0, practice_count: 0)
        end 

        if self.total_shows == 1
            self.update(reputation: 1)
            increment_musician_rep
        elsif self.total_shows == 50
            self.update(reputation: 2)
            increment_musician_rep
        elsif self.total_shows == 100
            self.update(reputation: 3)
            increment_musician_rep
        elsif self.total_shows == 150
            self.update(reputation: 4)
            increment_musician_rep
        elsif self.total_shows == 220
            self.update(reputation: 4)
            increment_musician_rep
        elsif self.total_shows == 330
            self.update(reputation: 5)
            increment_musician_rep
        elsif self.total_shows == 440
            self.update(reputation: 6)
            increment_musician_rep
        elsif self.total_shows == 575
            self.update(reputation: 7)
            increment_musician_rep
        elsif self.total_shows == 700
            self.update(reputation: 8)
            increment_musician_rep
        elsif self.total_shows == 850
            self.update(reputation: 9)
            increment_musician_rep
        elsif self.total_shows == 1000
            self.update(reputation: 10)
            increment_musician_rep
        end 
    

        tired_musicians = []

        self.musicians.each do |musician|
            musician.increment!(:total_shows)
            if musician.fatigue_level >= 4
                tired_musicians << musician 
            end 
        end 

        if tired_musicians != [] && self.mood <= 2 
            if self.mood == 2 || self.mood == 1
                count = rand(tired_musicians.count + 1)
                if tired_musicians[count]
                     @musician_name = tired_musicians[count].name

                     tired_musicians[count].leave_band 
                end 
            elsif self.mood == 0
                count = rand(tired_musicians.count)
                @musician_name = tired_musicians[count].name

                tired_musicians[count].leave_band
            end 
        end 

        self.musicians.each do |m|
            m.increment!(:fatigue_level, 1)
        end 

        @musician_name if @musician_name
    end 

    def assess_fatigue
        if self.shows.last 
            if TimeDifference.between(self.shows.last.created_at, Time.now.utc).in_minutes > 8
                self.musicians.each{|m| m.update(fatigue_level: 0)}

            elsif TimeDifference.between(self.shows.last.created_at, Time.now.utc).in_minutes.between?(5,7)
                self.musicians.each{|m| m.update(fatigue_level: rand(1..3)) if m.fatigue_level >= 4}

            elsif TimeDifference.between(self.shows.last.created_at, Time.now.utc).in_minutes > 2
                self.musicians.each{|m| m.update(fatigue_level: rand(2..3)) if m.fatigue_level >= 4}
            end 
        end 
    end
        

    def missing_instrument?
        instrument = []
            
        instrument << "vocals"  if self.musicians.vocals == []
        instrument << "guitar"  if self.musicians.guitar == []
        instrument << "drums"  if self.musicians.drums == []
        instrument << "bass"   if self.musicians.bass == [] 
  
        if instrument == []
            false 
        else  
            instrument 
        end 
    end 

  private 

    def increment_musician_rep
        self.musicians.each do |m|
            m.increment!(:reputation)
        end 
    end 

    def disband
        self.musicians.each{|m| m.leave_band}
    end 

    def missing_vocals?
        self.musicians.vocals == [] && self.vocalist_id == nil
    end 

    def missing_guitarist?
        self.musicians.guitar == [] && self.guitarist_id == nil 
    end 

    def missing_drummer?
        self.musicians.drums == [] && self.drummer_id == nil
    end 

    def missing_bassist?
        self.musicians.bass == [] && self.bassist_id == nil
    end 

end
