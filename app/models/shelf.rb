class Shelf < ApplicationRecord
    belongs_to :club
    has_many :books

    serialize :read_books, Array
    serialize :upcoming_books, Array

end
