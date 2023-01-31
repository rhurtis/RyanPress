# profile properties
=begin
    username/nickname varchar
    real name (first/last) varchar
    fun fact varchar
    dob date/timestamp

=end
# profile will not be required to just read, bookmark, or post anonymously.
# question: what are the tradeoffs between creating an entry with null values but not using it VS
# not creating an entry at all, until it is requested or necessary.
class Profile < ApplicationRecord
    validates :username presence: true, uniqueness: true, length: {minimum: 3, maximum: 20}
    belongs_to: user    
end