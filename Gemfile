source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.6.1'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 6.0.2', '>= 6.0.2.1'
# Use sqlite3 as the database for Active Record

# Use Uglifier as compressor for JavaScript assets

# Use Puma as the app server
gem 'puma', '~> 4.1'
gem 'activeadmin'
gem 'cancancan'
gem 'devise'
gem 'chosen-rails'
# Use SCSS for stylesheets
gem 'sass-rails', '>= 6'
gem 'sprockets', '~> 4'
gem 'sprockets-rails', :require => 'sprockets/railtie'
# Transpile app-like JavaScript. Read more: https://github.com/rails/webpacker
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.7'
gem 'dotenv-rails'
gem "aws-sdk-s3", require: false
gem 'ransack'
gem 'uglifier', '>= 1.3.0'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 4.0'
# Use Active Model has_secure_password
# gem 'bcrypt', '~> 3.1.7'
gem 'active_admin_flat_skin'
gem "font-awesome-rails"
gem 'whenever', require: false
gem 'activestorage-validator'
gem 'flex-slider-rails'

gem 'geocoder'
gem 'jquery-ui-rails'
gem 'bootstrap', '~> 4.4.1'
gem 'jquery-rails'
gem "jquery-slick-rails"

# Use Active Storage variant
# gem 'image_processing', '~> 1.2'
gem 'jquery-turbolinks'
# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.4.2', require: false
gem 'mailgun-ruby', '~>1.1.6'
gem "letter_opener", :group => :development
gem 'fullcalendar-rails'
gem 'momentjs-rails'
group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
end
group :development do
  # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'sqlite3', '~> 1.4'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :production do
  gem 'pg'
end

group :test do
  # Adds support for Capybara system testing and selenium driver
  gem 'capybara', '>= 2.15'
  gem 'selenium-webdriver'
  # Easy installation and use of web drivers to run system tests with browsers
  gem 'webdrivers'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
