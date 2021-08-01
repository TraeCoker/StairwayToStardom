class User < ApplicationRecord
    has_one :band 
    has_many :musicians, through: :band 
    enum role: [:band_manager, :venue_manager]

    has_secure_password
end
