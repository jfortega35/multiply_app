require "multiply_app"

use Rack::Reloader, 0

run MultiplyApp.new

#run Rack::Cascade.new([Rack::File.new("public"), SettingCookiesApp])
