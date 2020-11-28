require 'rails_helper'

RSpec.describe Station, type: :model do
  describe 'validations' do
    it { should validate_presence_of :station_id }
    it { should validate_presence_of :location }
    it { should validate_presence_of :lat }
    it { should validate_presence_of :lon }
  end
end
