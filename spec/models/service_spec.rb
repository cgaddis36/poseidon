require 'rails_helper'

RSpec.describe Service, type: :model do
  it { should validate_presence_of :name }

  it { should have_many :business_services }
  it { should have_many(:businesses).through(:business_services) }
end
