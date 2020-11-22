class Customer < ApplicationRecord
    has_many :vehicles
    has_many :dealerships, through: :vehicles
    has_secure_password

    validates :email, presence: true, uniqueness: true
    
    
end
