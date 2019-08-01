require "sinatra/activerecord"
require "require_all"
require "pry"
require "tty-prompt"
require "colorize"

require_all './lib'

ActiveRecord::Base.establish_connection(adapter: 'sqlite3', database: 'db/trees.db')
ActiveRecord::Base.logger = nil

# system "clear"

# Application.application_runner
