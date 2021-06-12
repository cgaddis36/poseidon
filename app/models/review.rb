class Review < ApplicationRecord
  validates :title, presence: true
  validates :comment, presence: true
  validates :rating, presence: true

  belongs_to :user
  belongs_to :business_service
end
