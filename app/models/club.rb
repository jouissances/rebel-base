# 1. Confirm relationships are appropriate

class Club < ApplicationRecord
    has_one :shelf, :dependent => :destroy
    has_many :books, through: :shelf
    has_many :readings, through: :books
    has_many :discussions, through: :readings
    has_many :comments, through: :discussions

    has_many :memberships, :dependent => :destroy
    has_many :users, through: :memberships, :dependent => :destroy

    acts_as_followable

    validates_presence_of %w(name genre description)

end
