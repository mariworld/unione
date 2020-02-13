class Character < ApplicationRecord
    belongs_to :user
    has_many :posts
    belongs_to :group
    validates :name, uniqueness: true
    validates :name, presence: true
end
