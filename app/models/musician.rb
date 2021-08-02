class Musician < ApplicationRecord
    belongs_to :band, optional: true 
    has_many :shows, through: :band 
    enum instrument: [:vocals, :drums, :guitar, :bass]
    validates :name, presence: true, uniqueness: true 

    def self.available(instrument)
        self.where(instrument: instrument, band_id: nil)
    end 

    def self.by_instrument(instrument)
        self.where(instrument: instrument)
    end 

end
