class User < ApplicationRecord
    has_secure_password
    has_many :trips
    has_many :activities
end
