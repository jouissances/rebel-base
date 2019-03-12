class BookSerializer < ActiveModel::Serializer
  attributes :id, :title, :author, :description, :isbn, :image, :link

  # include image link

  belongs_to :shelf
  
  has_many :discussions
  has_many :comments, through: :discussions

end
