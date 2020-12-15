class Store < ApplicationRecord
  validates :name, :state, :city, :zip, :address, :tags, :phone_number, presence: true
end
