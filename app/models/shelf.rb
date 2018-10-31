class Shelf < ApplicationRecord
    belongs_to :club, :dependent => :destroy
    has_many :books, :dependent => :destroy

    serialize :read_books, Array
    serialize :upcoming_books, Array

end
