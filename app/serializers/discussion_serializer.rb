class DiscussionSerializer < ActiveModel::Serializer
  attributes :id, :title, :body, :book_quote, :comments_with_user

  # include created_at and updated_at

  belongs_to :book
  belongs_to :user

  # has_many :comments

  def comments_with_user
    array = []
    object.comments.map do |comment|
      hash = {}
      hash['id'] = comment.id
      hash['body'] = comment.body
      hash['created_at'] = comment.created_at
      hash['updated_at'] = comment.updated_at
      hash['discussion_id'] = comment.discussion.id
      hash['username'] = comment.user.username
      array << hash
    end
    array
  end

end
