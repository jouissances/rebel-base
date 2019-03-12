class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :first_name, :last_name, :gender, :image, :location, :bio, :twitter, :facebook, :instagram

  has_many :memberships
  has_many :clubs, through: :memberships
  has_many :shelves, through: :clubs
  has_many :books, through: :shelves

  has_many :comments
  has_many :discussions
  
end
