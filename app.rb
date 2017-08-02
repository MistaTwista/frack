require 'yaml'
require './initializer'

routes_path = File.join(File.dirname(__FILE__), 'app', 'routes.yml')
routes_config = File.read(routes_path)
ROUTES = YAML.safe_load(routes_config)

require './lib/router'

# main App
class App
  attr_reader :router

  def initialize
    @router = Router.new(ROUTES)
  end

  def call(env)
    result = @router.resolve(env)
    [result.status, result.headers, result.body]
  end
end
