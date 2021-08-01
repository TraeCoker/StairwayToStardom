class Venue < ApplicationRecord
    belongs_to :user, optional: true 
    has_many :shows 
    has_many :reviews, through: :shows 
end
