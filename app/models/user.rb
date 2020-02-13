class User < ApplicationRecord
    enum role: [:user, :vip, :admin]
    after_initialize :set_default_role, :if => :new_record?
    has_one_attached :avatar
    has_many :posts
    has_many :groups, through: :posts
    #has_many :comments
    #has_many :characters
    #belongs_to :group, optional: true
    validates :username, uniqueness: true
    validates :username, presence: true
    has_secure_password

    def set_default_role
        self.role ||= :user
      end
end
