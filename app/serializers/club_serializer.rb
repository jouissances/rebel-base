class ClubSerializer < ActiveModel::Serializer
  attributes :id, :name, :genre, :description, :followers_count, :subgenre

  has_one :shelf
  has_many :books, through: :shelf
  has_many :discussions, through: :books
  has_many :comments, through: :discussions

  has_many :memberships
  has_many :users, through: :memberships

end
