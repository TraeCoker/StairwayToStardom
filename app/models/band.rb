class Band < ApplicationRecord
    belongs_to :user 
    has_many :musicians 
    has_many :shows 
    has_many :reviews, through: :shows 
    validates :name, presence: true, uniqueness: true
    validates :genre, :location, presence: true 
    accepts_nested_attributes_for :musicians
    after_initialize :set_defaults
    before_destroy :disband

   
        
    def recruit_musicians
        musician_ids = [self.vocalist_id, self.drummer_id, self.guitarist_id, self.bassist_id]
        Musician.join_band(self.id, musician_ids)
    end 

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
        self.mood ||= 2
        self.tier ||= 1
    end 

    def self.rank_by_reputation
        self.order("reputation")
    end 

    def play_show
        stats_hash = { practices: practice_count, mood: mood, reputation: reputation, }
 

    end 
  private 
    
    def disband
        self.musicians.each{|m| m.leave_band}
    end 

end
