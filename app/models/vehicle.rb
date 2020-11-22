class Vehicle < ApplicationRecord
    belongs_to :customer
    belongs_to :dealership

    validate :cannot_go_past_this_year
  
    def cannot_go_past_this_year
      if year > Time.current.year
        errors.add(:year, "this year hasnt come out yet")
      end
    end    
end
