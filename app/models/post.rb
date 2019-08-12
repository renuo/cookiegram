class Post < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  validates :description, presence: true,
            length: { minimum: 1 }
  validates :image, presence: true
end
