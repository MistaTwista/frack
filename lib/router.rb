# Implement router
class Router
  attr_reader :routes

  def initialize(routes)
    @routes = routes
  end

  def resolve(env)
    req = Rack::Request.new(env)
    path = req.path
    return controller(routes[path], env).call if routes.key?(path)
    Controller.new.not_found
  rescue StandardError => error
    print_error(error)
    Controller.new.internal_error
  end

  private

  def print_error(error)
    puts error.message
    puts error.backtrace
  end

  def controller(name, env)
    controller_name, action_name = name.split('#')
    controller = Object.const_get "#{controller_name.capitalize}Controller"
    controller.new(name: controller_name, action: action_name.to_sym, env: env)
  end
end
