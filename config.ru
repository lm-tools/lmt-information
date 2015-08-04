require "rack/jekyll"
require "yaml"

use Rack::Auth::Basic, "Restricted Area" do |username, password|
  [username, password] == [ENV["HTTP_USERNAME"], ENV["HTTP_PASSWORD"]]
end

run Rack::Jekyll.new
