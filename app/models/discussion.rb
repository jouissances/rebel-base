class Discussion < ApplicationRecord
    has_many :comments

    belongs_to :book
    belongs_to :user

    belongs_to :reading
    belongs_to :club
    belongs_to :shelf
end
