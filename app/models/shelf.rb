class Shelf < ApplicationRecord
    belongs_to :club

    has_many :books

end
