source 'https://rubygems.org'

ruby '2.0.0'

gem 'rails', '3.2.13'

gem 'rails-api'

gem 'pg'
gem 'thin'
gem 'decent_exposure'
gem 'active_model_serializers'
gem 'seedbank', github: 'james2m/seedbank'
gem 'dotenv'
gem 'strong_parameters'
gem 'devise'
gem 'rollbar'
gem 'interactor-rails'

group :development do
  gem 'letter_opener'
  gem 'foreman'
  gem 'bullet'

  gem 'guard-rspec'
  gem 'rb-fsevent', require: false
  gem 'zeus'
  gem 'rails-erd'
end

group :development, :test do
  gem 'debugger'
  gem 'rspec-rails'
  gem 'mail_safe'
  gem 'rails_best_practices'
  gem 'brakeman'
end

group :test do
  gem 'simplecov', require: false
  gem 'webmock', require: false

  gem 'capybara'
  gem 'database_cleaner'
  gem 'email_spec'
  gem 'shoulda-matchers'
end

group :development, :staging do
  gem 'api_taster'
end

group :development, :test, :staging do
  gem 'faker'
  gem 'factory_girl_rails'
end
