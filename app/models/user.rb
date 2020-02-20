class User < ApplicationRecord
    has_one_attached :avatar
    has_many :posts, dependent: :destroy
    has_many :groups, through: :posts
    has_many :owned_groups, foreign_key: :owner_id, class_name: "Group"
    validates :username, uniqueness: true
    validates :username, presence: true
    validates :password, presence: true, on: :create  
    has_secure_password
    #has_many :comments
    #has_many :characters
    #belongs_to :group, optional: true
end
