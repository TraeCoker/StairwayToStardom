class Show < ApplicationRecord
    belongs_to :band 
    belongs_to :venue
    has_one :review 
    
end
