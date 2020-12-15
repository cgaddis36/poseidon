class Store < ApplicationRecord
  validates :name, :state, :city, :zip, :address, :phone_number, presence: true

  def self.nearby_bait(state, zip)
    require "pry"; binding.pry
    where(zip: zip)
  end
end
