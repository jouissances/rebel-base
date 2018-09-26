class Shelf < ApplicationRecord
    belongs_to :club
    # belongs_to :book

    has_many :books
end
