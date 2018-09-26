# 1. Confirm relationships are appropriate

class Book < ApplicationRecord    
    belongs_to :shelf
    delegate :club, to: :user, allow_nil: true

    # has_many :shelves
    # has_many :clubs, through: :shelves

    has_many :discussions
    has_many :comments, through :discussions

end
