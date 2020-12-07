class Dealership < ApplicationRecord
    has_many :vehicles
    has_many :customers, through: :vehicles

    validates :rating, numericality: { greater_than: 0, less_than_or_equal_to: 10 }
    validates :name, presence: true
    validates :kind, presence: true
    
    
    

end
