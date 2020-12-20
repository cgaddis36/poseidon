class Review < ApplicationRecord
  validates :comment, presence: true
  validates :rating, presence: true

  belongs_to :user
  belongs_to :store
end