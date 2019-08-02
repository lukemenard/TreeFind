require "sinatra/activerecord"
require "require_all"
require "pry"
require "tty-prompt"
require "tty-box"
require "colorize"

require_all './lib'

ActiveRecord::Base.establish_connection(adapter: 'sqlite3', database: 'db/trees.db')
ActiveRecord::Base.logger = nil

def app
    Application.get_username
    Application.application_runner
end

app
