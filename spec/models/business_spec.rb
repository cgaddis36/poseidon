require 'rails_helper'

RSpec.describe Business, type: :model do
  describe 'validations' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :address }
    it { should validate_presence_of :city }
    it { should validate_presence_of :state }
    it { should validate_presence_of :zip }
    it { should validate_presence_of :phone_number }

    it { should have_many :business_services }
    it { should have_many(:services).through(:business_services) }
  end
end
