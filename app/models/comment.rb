# 1. Confirm relationships are appropriate

class Comment < ApplicationRecord
    belongs_to :discussion
    belongs_to :user

    acts_as_mentioner

    validates :body, presence: {:message => 'cannot be blank, comment cannot be saved.'}

end
