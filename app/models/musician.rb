class Musician < ApplicationRecord
    belongs_to :band, optional: true 
    has_many :shows, through: :band 
    enum instrument: [:vocals, :drums, :guitar, :bass]
    validates :name, presence: true, uniqueness: true 

    def self.vocalists
        self.where(instrument: 0)
    end 

    def self.drummers
        self.where(instrument: 1)
    end 

    def self.guitarists
        self.where(instrument: 2)
    end 

    def self.bassists
        self.where(instrument: 3)
    end 

end
