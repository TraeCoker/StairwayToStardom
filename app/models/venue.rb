class Venue < ApplicationRecord
    belongs_to :user, optional: true 
    has_many :shows 
    has_many :reviews, through: :shows 

    def self.sort_by_tier(unlocked_tier)
        self.where(tier: unlocked_tier)
    end 
end
