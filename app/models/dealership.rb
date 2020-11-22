class Dealership < ApplicationRecord
    has_many :vehicles
    has_many :customers, through: :vehicles

    validates :rating, inclusion: { in: %w[1..10],
    message: "%{value} is not a valid size" }

end
