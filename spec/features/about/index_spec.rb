require 'rails_helper'

RSpec.describe 'As a user when I visit the about page' do
  it 'I see a nice pretty About me page with summaries of my mission statement and nonprofits wer aim to help as well as contact information' do
    visit '/'

    click_on('About')

    expect(current_path).to eq(about_path)
    
    expect(page).to have_content('Poseidons Forecast')

    within(".about") do
      expect(page).to have_content('About Us')
    end

    within(".contact") do
      expect(page).to have_content('Chase Gaddis')
      expect(page).to have_content('(850) 582-2223')
      expect(page).to have_content('cgaddis36@gmail.com')
    end


    within(".future_iterations") do
      expect(page).to have_content('Future')
    end
  end
end
