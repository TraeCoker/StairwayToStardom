class Musician < ApplicationRecord
    belongs_to :band, optional: true 
    has_many :shows, through: :band 
    enum instrument: [:vocals, :drums, :guitar, :bass]
    validates :name, presence: true, uniqueness: true 
    serialize :past_bands, Array
    serialize :past_genres, Array
    after_initialize :set_defaults

    def set_defaults 
        self.reputation ||= 0
        self.fatigue_level ||= 0
    end 

    def leave_band
        self.past_bands << self.band.name
        self.past_genres << self.band.genre 

        self.update(band_id: nil)
    end 
        


    def self.available(band_reputation)
        self.where(band_id: nil, reputation: 0..band_reputation)
    end 

    def self.available_vocalists
        self.where(instrument: 0, band_id: nil)
    end 

    def self.available_drummers
        self.where(instrument: 1, band_id: nil)
    end 

    def self.available_guitarists
        self.where(instrument: 2, band_id: nil)
    end 

    def self.available_bassists
        self.where(instrument: 3, band_id: nil)
    end 

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

    #def self.join_band(band_id, musician_ids)
     #   musician_ids.each do |id|
      #      musician = Musician.find_by_id(id)
       #     musician.update(band_id: band_id)
       # end 
    #end 


end
