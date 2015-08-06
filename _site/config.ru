<<<<<<< HEAD
require "rack/jekyll"
require "yaml"
=======
require 'rubygems'
require 'sinatra'
require 'json'
require 'pony'
>>>>>>> Redirect root url to index

use Rack::Auth::Basic, "Restricted Area" do |username, password|
  [username, password] == [ENV["HTTP_USERNAME"], ENV["HTTP_PASSWORD"]]
end

run Rack::Jekyll.new
