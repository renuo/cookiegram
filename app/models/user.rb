class User < ApplicationRecord
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  VALID_USERNAME_REGEX = /\A([A-z\-])+\z/i

  before_save do
    self.email = email.downcase
    self.username = username.downcase
  end

  has_many :posts, dependent: :destroy
  has_many :comments, through: :posts
  validates :description, presence: true,
            length: { minimum: 3, maximum: 255 }
  validates :email, presence: true,
           uniqueness: { case_sensitive: false },
           format: { with: VALID_EMAIL_REGEX },
           length: { minimum: 3, maximum: 50 }
  validates :username, presence: true,
            uniqueness: { case_sensitive: false },
            format: { with: VALID_USERNAME_REGEX },
            length: { minimum: 3, maximum: 50 }
  validates :image, presence: true,
            length: { minimum: 3 }

  has_secure_password

end
