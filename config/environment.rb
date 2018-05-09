require 'rake'
require 'rest-client'
require 'json'
require 'pry'
require 'yaml/store'

require 'bundler/setup'
Bundler.require

ActiveRecord::Base.establish_connection(adapter: 'sqlite3', database: 'db/development.db')

require_all "lib"
require_all "app"
