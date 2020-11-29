require 'rails_helper'

RSpec.describe Station, type: :model do
  describe 'validations' do
    it { should validate_presence_of :station_id }
    it { should validate_presence_of :location }
    it { should validate_presence_of :lat }
    it { should validate_presence_of :lon }
    it { should validate_presence_of :url }
    it { should validate_presence_of :pred_type }
    it { should validate_presence_of :state }
  end
end
