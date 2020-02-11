class User < ApplicationRecord
    has_many :posts
    has_many :comments
    belongs_to :group, optional: true
    validates :username, uniqueness: true
    has_secure_password

end
