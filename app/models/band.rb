class Band < ApplicationRecord
    belongs_to :user 
    has_many :musicians 
    has_many :shows 
    has_many :reviews, through: :shows 
    validates :name, presence: true, uniqueness: true
    validates :genre, :location, presence: true 
    accepts_nested_attributes_for :musicians
    after_initialize :set_defaults

    def recruit_musicians
        musician_ids = [self.vocalist_id, self.drummer_id, self.guitarist_id, self.bassist_id]
        Musician.join_band(self.id, musician_ids)
    end 

    def set_defaults
        self.reputation ||= 0
        self.practice_count ||= 0
        self.total_shows ||= 0
        self.mood ||= 2
    end 


end
