class User < ApplicationRecord
    has_secure_password # makes password field mandatory
    validates :email, presence: true, uniqueness: true
    has_many :trips
end
