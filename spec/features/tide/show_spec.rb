require 'rails_helper'

RSpec.describe 'As a visitor when I enter a correct ZipCode in and click Get Tides' do
  before(:each) do
    @station = Station.create(location: "Amelia City, South Amelia River", lat: "+30.5867", lon: "-81.4633", station_id: "8720086", url: "/noaatidepredictions.html?id=8720086", pred_type: "Subordinate", state: "Florida")
    @station1 = Station.create(location: "entrance", lat: "+30.5183", lon: "-81.4533", station_id: "8720135", url: "/noaatidepredictions.html?id=8720135", pred_type: "Subordinate", state: "Florida")
    @destin = Station.create(location: "East Pass (Destin)", lat: "+30.3950", lon: "-86.5133", station_id: "8729511", url: "/noaatidepredictions.html?id=8729511", pred_type: "Subordinate", state: "Florida")
  end
  it 'I am taken to the tides show page where I can see all of my forecasted tides data' do
    visit '/'

    fill_in 'Zipcode', with: '32541'

    click_button('Get Tides')

    expect(page).to have_content('Destin, Florida')

    expect(page).to have_content('Hourly Tides Forecast')

    expect(page).to have_content('Data Powered by NOAA')

    expect(page).to have_css('.frame', count: 1)
  end
  it 'Routes correctly in the navbar after a zipcode has been entered and sent to the Forecast show page first' do
    visit '/'

    fill_in 'Zipcode', with: '32541'

    click_button('Get Forecast')

    within('.topnav') do
      click_link('Tides')
    end

    expect(page).to have_content('Destin, Florida')

    expect(page).to have_content('Hourly Tides Forecast')

    expect(page).to have_content('Data Powered by NOAA')

    expect(page).to have_css('.frame', count: 1)
    expect(current_path).to eq(tides_path)
  end
end
