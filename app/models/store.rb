class Store < ApplicationRecord
  validates :name, :state, :city, :zip, :address, :phone_number, presence: true

  def self.nearby_bait(zip)
    where(zip: zip).where(bait: true).where(public: true)
  end

  def self.nearby_fly(zip)
    where(zip: zip).where(fly: true).where(public: true)
  end
end
