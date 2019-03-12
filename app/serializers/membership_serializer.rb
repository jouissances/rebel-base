class MembershipSerializer < ActiveModel::Serializer
  attributes :id, :admin

  belongs_to :club
  belongs_to :user

end
