class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  devise :omniauthable, :omniauth_providers => [:facebook]

  has_many :memberships
  has_many :clubs, through: :memberships
  has_many :shelves, through: :clubs
  has_many :books, through: :shelves

  has_many :comments
  has_many :discussions

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |u|
      u.first_name = auth['info']['name'].partition(" ").first
      u.last_name = auth['info']['name'].partition(" ").last
      u.email = auth['info']['email']
      u.image = auth['info']['image']
      u.password = Devise.friendly_token[0,20]
    end
  end

end
