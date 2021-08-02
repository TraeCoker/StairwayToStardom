class Musician < ApplicationRecord
    belongs_to :band 
    has_many :shows, through: :band 
    enum instrument: [:vocals, :drums, :guitar, :bass]
    validates :name, presence: true, uniqueness: true 
end
