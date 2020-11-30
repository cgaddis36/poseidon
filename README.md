# README

Poseidon Fishing Tides & Forecasts
- Hourly Fishing Forecasts
- Application designed to pull the projected weather, tides &  wind forecast all in one place
- Webscrape NOAA Stations for real-time Tide predictions

* Ruby version: 2.5.3

* Rails version: 5.2.4

* System dependencies
  ~ bundle install
  ~ figaro install

* Configuration
  ~ AERIS API Config
    follow sign up instructions here: https://www.aerisweather.com/support/docs/api/getting-started/
    
  - config/application.yml file insert your aeris access id and secret key following this format:
    - AERIS_ACCESS_ID: your_key_here123
    - AERIS_SECRET_KEY: your_secret_here456

* PSQL database
  rails db:{create,migrate,seed}

* How to run the test suite
  ~ RSpec testing suite
    bundle exec rspec
