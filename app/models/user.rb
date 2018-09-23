class User < ApplicationRecord
    has_many :books
    has_many :clubs, through: :books

    has_secure_password
end
