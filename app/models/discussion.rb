class Discussion < ApplicationRecord
    has_many :comments

    belongs_to :book
    belongs_to :user

    validates :title, presence: {:message => 'cannot be blank, discussion cannot be saved.'}
    validates :body, presence: {:message => 'cannot be blank, discussion cannot be saved.'}

end
