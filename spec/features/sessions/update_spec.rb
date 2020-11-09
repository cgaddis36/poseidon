require 'rails_helper'

RSpec.describe 'When I enter a correct zipcode and click the get forescast button' do
  it 'Then the zipcode is saved as a session' do
    visit '/'

    within '.form-group' do
      fill_in 'Zipcode', with: '32541'
    end

    within all('.text-center').last do
      click_button('Get Forecast')
    end

    expect(current_path).to eq('/forecast')

    expect(page).to have_css('#wind_fore', count: 200)
    expect(page).to have_css('#weather_fore', count: 200)
    expect(page).to have_css('#tide_hgt', count: 200)
    expect(page).to have_css('#water_temp', count: 200)
  end

  it 'incorrect zipcode sad path' do
    visit '/'

    within '.form-group' do
      fill_in 'Zipcode', with: '00000'
    end

    within all('.text-center').last do
      click_button('Get Forecast')
    end

    expect(current_path).to eq('/')
    expect(page).to have_content('Zipcode does not exist, enter a correct zipcode to continue.')
  end
end
