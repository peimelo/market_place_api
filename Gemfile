source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "2.7.2"

gem "rails", "~> 6.0.3", ">= 6.0.3.2"
gem "pg", ">= 0.18", "< 2.0"
gem "puma", '~> 5.0'
gem "bootsnap", ">= 1.4.2", require: false

group :development, :test do
  gem "byebug", platforms: [:mri, :mingw, :x64_mingw]
end

group :development do
  gem "listen", "~> 3.2"
  gem "spring"
  gem "spring-watcher-listen", "~> 2.0.0"
end

gem "tzinfo-data", platforms: [:mingw, :mswin, :x64_mingw, :jruby]

gem "bcrypt", "~> 3.1"

gem "jwt", "~> 2.2"

gem "faker", "~> 2.13"

gem "fast_jsonapi", "~> 1.5"

gem "kaminari", "~> 1.2"

gem "bullet", "~> 6.1", :group => :development

gem "rack-cors", "~> 1.1"
