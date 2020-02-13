class Group < ApplicationRecord
    has_one_attached :avatar
    has_many :posts
    has_many :users, through: :posts
    #has_many :characters
    validates :name, uniqueness: true
    validates :name, presence: true
end
