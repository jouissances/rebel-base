class User < ApplicationRecord
    has_many :memberships
    has_many :clubs, through: :memberships
    has_many :shelves, through: :clubs
    has_many :books, through: :shelves

    has_many :comments
    has_many :discussions

    has_secure_password

    validates :email, presence: true, uniqueness: true
    validates :password, presence: true
    validates :password_confirmation, presence: true
    validates :first_name, presence: true
    validates :last_name, presence: true
    validates_confirmation_of :password
    
    def self.create_with_omniauth(auth)
        user = find_or_create_by(uid: auth['uid']) do |u|
            u.first_name = auth['info']['name'].partition(" ").first
            u.last_name = auth['info']['name'].partition(" ").last
            u.email = auth['info']['email']
            u.image = auth['info']['image']
        end

        if self.exists?(user)
          user
        else
          user.save!
          user
        end
    end

end
