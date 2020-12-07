class Vehicle < ApplicationRecord
    belongs_to :customer, optional: true
    belongs_to :dealership

    validate :cannot_go_past_this_year
    validates :year, presence: true
    validates :make, presence: true 
    validates :model, presence: true
    
  
    def cannot_go_past_this_year
      if year > Time.current.year + 1
        errors.add(:year, "this year hasnt come out yet")
      end
    end    

    scope :with_no_customer, -> { where(:customer => nil)}
  
end
