class Profile < ApplicationRecord
    validates :username, presence: true, uniqueness: true, length: {minimum: 3, maximum: 20}
    belongs_to :user    
end