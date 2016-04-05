source 'https://rubygems.org'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.3'
# # Use sqlite3 as the database for Active Record
# gem 'sqlite3'
# Use SCSS for stylesheets

gem 'puma'
gem 'pg'
gem 'pundit'

gem 'aws-sdk'
gem "paperclip"

gem 'reform'
gem 'reform-rails'

gem 'bootstrap-sass', '~> 3.3.5'
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.1.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0', group: :doc

gem 'chartkick'

# sabisu stuff
# gem 'sabisu_rails', github: "IcaliaLabs/sabisu-rails"
# gem 'compass-rails'
# gem 'furatto'
# gem 'simple_form'

source 'https://rails-assets.tenex.tech' do
  gem 'rails-assets-jquery-bar-rating', '1.1.3'
end

group :development do
  # gem 'sqlite3'
end

group :production do
  gem 'rails_12factor'
end

group :development, :test do
  gem "factory_girl_rails"
  gem 'ffaker'
end

group :test do
  gem "rspec-rails", "~> 2.14"
  gem "shoulda-matchers"
  gem "email_spec"
end

gem 'devise'
