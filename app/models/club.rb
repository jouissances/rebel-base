# 1. Confirm relationships are appropriate

class Club < ApplicationRecord
    has_one :shelf
    has_many :books, through: :shelf
    has_many :discussions, through: :books
    has_many :comments, through: :discussions

    has_many :memberships
    has_many :users, through: :memberships 

    acts_as_followable

    validates_presence_of %w(name genre description)

end
