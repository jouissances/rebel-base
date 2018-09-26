class Discussion < ApplicationRecord
    has_many :comments

    belongs_to :book
    belongs_to :user
end
