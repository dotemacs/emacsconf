source 'https://rubygems.org'

gem 'rails', '3.2.6'
gem 'devise', '2.0.4'
gem 'make_voteable', '0.1.1'

gem 'pg'

gem 'unicorn', :group => :production

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

group :development, :test do
  gem 'rspec-rails', '2.10.1'
  gem 'shoulda-matchers', '1.0.0'
  # database_cleaner is not required, but highly recommended
  gem 'database_cleaner'
  gem 'factory_girl_rails', '3.0.0'
  gem 'mailcatcher', '0.5.6'
end

gem 'cucumber-rails', '1.3.0', :group => :test
gem 'email_spec', :group => :test
