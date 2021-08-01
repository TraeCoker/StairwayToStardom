class Musician < ApplicationRecord
    belongs_to :band 
    has_many :shows, through: :band 
end
