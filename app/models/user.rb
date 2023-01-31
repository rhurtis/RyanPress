class User < ApplicationRecord
    encrypts :email, deterministic: true, downcase: true
    validates :email, presence: true, uniqueness: true
    encrypts :password
    validates  :password, presence: true
end