# 1. Confirm relationships are appropriate

class Book < ApplicationRecord    
    belongs_to :shelf, optional: true
    delegate :club, to: :shelf, allow_nil: true

    acts_as_likeable

    # has_many :shelves
    # has_many :clubs, through: :shelves

    # has_many :discussions
    # has_many :comments, through: :discussions

end
