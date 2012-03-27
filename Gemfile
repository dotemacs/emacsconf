source 'https://rubygems.org'

gem 'rails', '3.2.2'
gem 'devise', '2.0.4'

gem 'sqlite3'

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'

  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  # gem 'therubyracer'

  gem 'uglifier', '>= 1.0.3'
end

gem 'jquery-rails'

group :test, :development do
  gem 'rspec-rails', '2.9.0'
  gem 'shoulda-matchers', '1.0.0'
  # database_cleaner is not required, but highly recommended
  gem 'database_cleaner'
  gem 'factory_girl_rails', '3.0.0'
end

# moved it out of the above block to suppress the error messages
gem 'cucumber-rails', '1.3.0', :group => :test
