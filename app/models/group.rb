class Group < ApplicationRecord
    has_one_attached :avatar
    has_many :posts
    has_many :users, through: :posts
    belongs_to :owner, foreign_key: :owner_id, class_name: "User"
    #has_many :characters
    validates :name, uniqueness: true
    validates :name, presence: true
end
