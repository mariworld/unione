class Post < ApplicationRecord
    belongs_to :user
    belongs_to :group
    has_one_attached :avatar
    validates :message, presence: true
end
