class Band < ApplicationRecord
    belongs_to :user 
    has_many :musicians 
    has_many :shows 
    has_many :reviews, through: :shows 
    validates: name, presence: true, uniqueness: true
    
end
