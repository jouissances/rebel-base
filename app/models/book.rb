# 1. Confirm relationships are appropriate

class Book < ApplicationRecord    
    extend FriendlyId
    friendly_id :title, use: :slugged
    
    belongs_to :shelf, optional: true
    delegate :club, to: :shelf, allow_nil: true

    has_many :discussions
    has_many :comments, through: :discussions

    validates :title, presence: {:message => 'cannot be blank, book cannot be saved.'}
    validates :author, presence: {:message => 'cannot be blank, book cannot be saved.'}
    validates :description, presence: {:message => 'cannot be blank, book cannot be saved.'}
    validates :isbn, presence: {:message => 'cannot be blank, book cannot be saved.'}

end
