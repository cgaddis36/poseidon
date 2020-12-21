require 'rails_helper'

RSpec.describe 'As a user when I have created a review and visit my user profile page' do
  before(:each) do
    @user = User.create!(first_name: 'User', last_name: 'Name', user_name: 'USerName', zip: '32541', password: '123', email: 'garfield@example.com')
    @store = Store.create!(name: 'Store', address: 'Address', phone_number: '8888888', city: 'Destin', state: 'Florida', zip: '32541', fly: true, public: true)
    @review = @store.reviews.create!(user_id: @user.id, rating: "5", comment: 'This is a really nice fly store')
  end
  it 'I see a link to delete my review that successfully deletes this review.' do
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)

    expect(@user.reviews.count).to eq(1)

    visit '/user'

    expect(page).to have_link("Delete Review")

    click_link("Delete Review")

    expect(current_path).to eq('/user')

    expect(page).to have_content("Review successfully deleted.")

    expect(@user.reviews.count).to eq(0)
  end
end
