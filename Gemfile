source 'https://rubygems.org'
ruby '2.0.0'
gem 'rails', '4.0.0'
gem 'sass-rails', '~> 4.0.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.0.0'
gem 'jquery-rails'
gem 'turbolinks'
gem 'jbuilder', '~> 1.2'
gem 'bootstrap-sass', '>= 3.0.0.0'
gem 'cancan'
gem 'devise'
gem 'figaro'
gem 'rolify'
gem 'simple_form'
gem 'unicorn'
gem 'rack-timeout'
gem 'rails_admin', git: 'git://github.com/sferik/rails_admin.git'
gem 'newrelic_rpm'

group :production do
  gem 'pg'
  gem 'rails_12factor' # Logging and assets with Heroku
end

group :development, :test do
  gem 'sqlite3'
  gem 'factory_girl_rails'
  gem 'rspec-rails'
  gem 'faker'
end

group :development do
  gem 'better_errors'
  gem 'binding_of_caller', :platforms=>[:mri_19, :mri_20, :rbx]
  gem 'quiet_assets'
  gem 'rails_layout'
end

group :test do
  gem 'capybara'
  gem 'database_cleaner'
  gem 'email_spec'
end
