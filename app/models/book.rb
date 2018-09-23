class Book < ApplicationRecord
    belongs_to :clubs
    belongs_to :users
end
