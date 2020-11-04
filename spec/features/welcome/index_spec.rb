require 'rails_helper'

RSpec.describe "when I visit the welcome page" do
  it "I see the nav bar, all links associated, and the current location sonar as well as forecast" do

    visit '/'

    within ".topnav" do
      expect(page).to have_link("Home")
      expect(page).to have_link("Forecast")
      expect(page).to have_link("Bait & Tackle")
      expect(page).to have_link("Fly Shops")
      expect(page).to have_link("Tournament Info")
      expect(page).to have_link("Local Fishing Tips")
    end
    within ".wv-heading--title" do
      expect(page).to have_content("Enter Your Zipcode")
    end
    within ".wv-heading--subtitle" do
      expect(page).to have_content("Local Tides, Wind Report, & Weather Forecast")
    end
    within ".myform form" do
      expect(page).to have_button("Get Forecast")
    end
  end
end
