class Book < ApplicationRecord
    has_many :clubs
    has_many :users, through: :clubs
end
