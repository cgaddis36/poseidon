require 'rails_helper'

RSpec.describe 'As a visitor, when I enter in a valid zipcode, and click on the Fly Shops button' do
  half_hitch = Store.create(name: 'Half Hitch Bait & Tackle', bait: true, address: '621 Harbor Blvd', city: 'Destin', state: 'Florida', zip: '32541', url: 'www.halfhitch.com', phone_number: '(850) 837-3121', description: 'Locally owned and operated Saltwater Live Bait & Tackle Store. Will serve all your needs from offshore deepsea reels and live shrimp, to inshore lures and flourocarbon')
  bass_pro = Store.create(name: 'Bass Pro Shops', fly: true, bait: true, address: '4301 Legendary Dr', city: 'Destin', state: 'Florida', zip: '32541', url: 'www.basspro.com', phone_number: '(850) 269-6200', description: 'One of the largest saltwater BassProShops, worth the visit. Have everything you could need while fishing in Destin aside from Live Bait')
  it 'takes me to the index page for Fly stores in the area' do
    visit '/'

    fill_in 'Zipcode', with: '32541'

    click_button 'Get Forecast'

    expect(current_path).to eq(forecast_path)

    within('.topnav') do
      click_link('Fly Shops')
    end

    expect(current_path).to eq(fly_path)

    expect(page).to have_css('.fly_shop', count: '1')
  end
  it 'when I do not have a Zipcode entered it redirects me to the homepage and asks me to enter a valid zipcode' do
    visit fly_path

    expect(current_path).to eq('/')

    expect(page).to have_content('Please Enter a Correct Zipcode to continue')
  end
end
