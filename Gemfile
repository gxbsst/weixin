source "http://ruby.taobao.org"

gem 'rack'
gem 'sinatra'

gem 'sinatra-synchrony', :require => 'sinatra/synchrony'
gem 'em-synchrony', :require => ['em-synchrony', 'em-synchrony/mysql2', 'em-synchrony/activerecord']

gem 'activerecord', '~> 3.2', :require => 'active_record'
gem "sinatra-activerecord"

gem 'mysql2'

gem 'dalli', :require => 'active_support/cache/dalli_store'

gem 'oj'

gem 'faraday'

gem 'rake'
# gem 'pony'   # pony must be after activerecord

gem 'thin'

gem 'rack-weixin'

group :production do
end

group :development do
  gem "tux"
  gem 'pry'
  gem 'sinatra-contrib'
end

group :test do 
  gem 'rspec', :require => "rspec/core"
  gem 'rack-test', :require => "rack/test"
  gem 'factory_girl'
  gem 'database_cleaner'
end
