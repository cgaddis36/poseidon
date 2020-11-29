require 'rails_helper'

RSpec.describe 'As a visitor when I enter a correct ZipCode in and click Get Tides' do
  it 'I am taken to the tides show page where I can see all of my forecasted tides data' do
    visit '/'

    fill_in 'Zipcode', with: '32541'

    click_button('Get Tides')

    expect(current_path).to eq(tides_path)

    expect(page).to have_content('Destin,FL')

    expect(page).to have_content('Hourly Tides Forecast')

    expect(page).to have_content('Data from NOAA')

    expect(page).to have_css('.hourly_tide', count: 50)

  end
end
