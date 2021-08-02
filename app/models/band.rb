class Band < ApplicationRecord
    belongs_to :user 
    has_many :musicians 
    has_many :shows 
    has_many :reviews, through: :shows 
    validates :name, presence: true, uniqueness: true
    validates :genre, :location, presence: true 
    accepts_nested_attributes_for :musicians

    def recruit_musicians
        musician_ids = [self.vocalist_id, self.drummer_id, self.guitarist_id, self.bassist_id]
        Musician.join_band(self.id, musician_ids)
    end 

end
