class User < ApplicationRecord
    has_one_attached :avatar
    has_many :posts
    has_many :groups, through: :posts

    has_many :owned_groups, foreign_key: :owner_id, class_name: "Group"
    #has_many :comments
    #has_many :characters
    #belongs_to :group, optional: true
    validates :username, uniqueness: true
    validates :username, presence: true
    has_secure_password
end
