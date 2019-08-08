class Post < ApplicationRecord
  validates :description, presence: true,
            length: { minimum: 1 }
  validates :image, presence: true
end
