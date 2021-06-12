require 'rails_helper'

RSpec.describe Review, type: :model do
  it { should validate_presence_of :title }
  it { should validate_presence_of :comment }
  it { should validate_presence_of :rating }

  it { should belong_to :user }
  it { should belong_to :business_service }
end
