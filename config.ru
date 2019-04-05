SESSION_SECRET= "9bc133a18d84a1cbfbd020057eb9ac393be5d1543a5fa81a6d9ea6c787041ea9c70960c573f7e0eec6555b1ef5334d01eea620794ee65e88b887f2166e23f251"

require 'dotenv'
require './config/environment'
require_relative 'app/controllers/books_controller'
require_relative 'app/controllers/users_controller'
Dotenv.load



if ActiveRecord::Migrator.needs_migration?
  raise 'Migrations are pending. Run `rake db:migrate` to resolve the issue.'
end

use Rack::MethodOverride
use Rack::Session::Cookie
use BooksController
use UsersController
run ApplicationController
