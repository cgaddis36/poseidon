require 'rails_helper'

RSpec.describe 'As a user when I visit a store page that has local stores in that Zipcode' do
  before(:each) do
    @user = User.create!(first_name: 'User', last_name: 'Name', user_name: 'USerName', zip: '32541', password: '123', email: 'garfield@example.com')
    @store = Store.create!(name: 'Store', address: 'Address', phone_number: '8888888', city: 'Destin', state: 'Florida', zip: '32541', fly: true, public: true)
    @review = @store.reviews.create!(user_id: @user.id, rating: "5", comment: 'This is a really nice fly store')
  end
  it 'shows a link that takes me to the shops reviews and I can create a new review' do
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)

    visit "/store/#{@store.id}"

    click_on('Leave a Review')

    expect(current_path).to eq("/store/#{@store.id}/review/new")

    fill_in 'comment', with: 'Great Shop'
    select '5', from: 'rating'

    click_on('Create Review')

    expect(current_path).to eq("/store/#{@store.id}")
    expect(page).to have_content("Review successfully created.")
    expect(page).to have_content(@store.reviews.last.comment)
  end
  it 'will not let you click New Review if you are not logged in' do
    visit "/store/#{@store.id}"

    click_on('Leave a Review')

    expect(current_path).to eq("/store/#{@store.id}")

    expect(page).to have_content("Must be logged in to leave a review. Please register or login to leave a review.")
  end
end
