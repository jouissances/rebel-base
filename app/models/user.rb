class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  extend FriendlyId
  friendly_id :username, use: :slugged

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  devise :omniauthable, :omniauth_providers => [:facebook]

  has_many :memberships
  has_many :clubs, through: :memberships
  has_many :shelves, through: :clubs
  has_many :books, through: :shelves

  has_many :comments
  has_many :discussions

  acts_as_follower
  acts_as_mentionable

  mount_uploader :image, AvatarUploader

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |u|
      u.username = auth['info']['name'].downcase.gsub(/\s+/, '')
      u.first_name = auth['info']['name'].partition(" ").first
      u.last_name = auth['info']['name'].partition(" ").last
      u.email = auth['info']['email']
      u.remote_image_url = auth['info']['image'].gsub('http', 'https')
      u.password = Devise.friendly_token[0,20]
    end
  end

  def country_name
    country = ISO3166::Country[location]
    if country.nil?
      "Hogwarts School of Witchcraft and Wizardry"
    else
      country.translations[I18n.locale.to_s] || country.name
    end
  end

end
