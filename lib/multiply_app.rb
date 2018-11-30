require "erb"

class MultiplyApp
  def call(env)
    @request = Rack::Request.new(env)
    case @request.path
      when "/"
        Rack::Response.new(render("index.html.erb"))
      when "/multiply"
        Rack::Response.new do |response|
          response.set_cookie("product", @request.params["number1"].to_f * @request.params["number2"].to_f)
          response.redirect("/")
        end
      else Rack::Response.new("Not Found", 404)
    end
  end

  def render(template)
    path = File.expand_path("../views/#{template}", __FILE__)
    ERB.new(File.read(path)).result(binding)
  end

  def product
    @request.cookies["product"] || "Not an integer"
  end

end
