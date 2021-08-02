class User < ApplicationRecord
    has_one :band 
    has_many :musicians, through: :band 
    enum role: [:band_manager, :venue_manager]
    validates :email, presence: true, uniqueness: true 
    validates :username, presence: true, uniqueness: true 
    has_secure_password
end
