class Business < ApplicationRecord
  validates :name, :state, :city, :zip, :address, :phone_number, presence: true

  has_many :business_services, dependent: :destroy
  has_many :services, :through => :business_services

  def self.nearby_bait(zip)
    where(zip: zip).where(bait: true).where(public: true)
  end

  def self.nearby_fly(zip)
    where(zip: zip).where(fly: true).where(public: true)
  end

  def self.nearby_guide(zip)
    where(zip: zip).where(guide: true).where(public: true)
  end
end
