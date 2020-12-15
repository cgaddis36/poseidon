require 'rails_helper'

RSpec.describe 'As a visitor, when I enter in a valid zipcode, and click on the Fly Shops button' do
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
end
