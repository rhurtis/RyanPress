class User < ApplicationRecord
    validates encrypts :email, presence: true, uniqueness: true, deterministic: true
    validates encrypts :password, presence: true
end