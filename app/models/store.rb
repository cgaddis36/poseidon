class Store < ApplicationRecord
  validates :name, :state, :city, :zip, :address, :tags, :phone_number, presence: true

  def self.nearby_bait(state, zip)
    where(zip: zip)
  end
end
