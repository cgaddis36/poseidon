class Store < ApplicationRecord
  validates :name, :state, :city, :zip, :address, :phone_number, presence: true

  has_many :reviews, dependent: :destroy

  def self.nearby_bait(zip)
    where(zip: zip).where(bait: true).where(public: true)
  end

  def self.nearby_fly(zip)
    where(zip: zip).where(fly: true).where(public: true)
  end

  def self.nearby_guide(zip)
    where(zip: zip).where(guide: true).where(public: true)
  end

  # def self.nearby_fly_guide(zip)
  #   where(zip: zip).where(fly: true).where(public: true)
  # end
  #
  # def self.nearby_charter_guide(zip)
  #   where(zip: zip).where(conventional: true).where(public: true)
  # end
  #
  # def self.nearby_hunting_guide(zip)
  #   where(zip: zip).where(hunting: true).where(public: true)
  # end
end
