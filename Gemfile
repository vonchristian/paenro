source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '5.1.0.rc1'
gem 'pg', '~> 0.18'
gem 'puma', '~> 3.7'
gem 'sass-rails'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.2'
gem 'jbuilder', '~> 2.5'
gem 'simple_form'
gem 'friendly_id'
gem 'bootstrap-sass'
gem "font-awesome-rails"
gem 'bootstrap-datepicker-rails'
gem "simple-line-icons-rails"
gem "select2-rails"
gem 'jquery-rails'
gem 'jquery-ui-rails'
gem 'paper_trail'
gem 'pg_search'
gem 'kaminari'
gem 'devise'
group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'rspec-rails', '~> 3.5'
  gem 'factory_girl_rails'
  gem 'rspec-its'

end

group :development do
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :test do
  gem 'shoulda-matchers', '~> 3.1'
  gem 'faker'
  gem 'database_cleaner'
  gem 'capybara'
  gem 'capybara-webkit'
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
