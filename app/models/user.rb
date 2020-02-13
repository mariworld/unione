class User < ApplicationRecord
    has_many :posts
    has_many :groups, through: :posts
    #has_many :comments
    #has_many :characters
    #belongs_to :group, optional: true
    validates :username, uniqueness: true
    validates :username, presence: true
    has_secure_password
end
