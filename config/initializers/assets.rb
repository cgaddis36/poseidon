# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

# Add additional assets to the asset load path.
# Rails.application.config.assets.paths << Emoji.images_path
# Add Yarn node_modules folder to the asset load path.
Rails.application.config.assets.paths << Rails.root.join('node_modules')

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in the app/assets
# folder are already added.
# Rails.application.config.assets.precompile += %w( admin.js admin.css )
Unsplash.configure do |config|
  config.application_access_key = ENV['UNSPLASH_API_KEY']
  config.application_secret = ENV['UNSPLASH_API_SECRET']
  config.application_redirect_uri = "http://localhost:3000/oauth/callback"
  config.utm_source = "alices_terrific_client_app"

end
