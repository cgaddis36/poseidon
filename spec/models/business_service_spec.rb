require 'rails_helper'

RSpec.describe BusinessService, type: :model do
  describe 'validations' do
    it { should belong_to :business }
    it { should belong_to :service }
    it { should have_many :reviews }
  end
end
