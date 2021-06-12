class Service < ApplicationRecord
  validates :name, presence: true

  has_many :business_services
  has_many :businesses, :through => :business_services
end
