# 1. Confirm relationships are appropriate

class Book < ApplicationRecord    
    belongs_to :shelf, optional: true
    delegate :club, to: :shelf, allow_nil: true

    has_many :readings
    has_many :discussions, through: :readings
    has_many :comments, through: :discussions

    acts_as_likeable

end
