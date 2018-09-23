class User < ApplicationRecord
    has_many :clubs
    has_many :books, through: :clubs

    has_secure_password
end
