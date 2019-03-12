class ShelfSerializer < ActiveModel::Serializer
  attributes :id, :current_book, :read_books, :upcoming_books
  
  belongs_to :club
  has_many :books

end
