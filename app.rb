require 'yaml'

class App
  attr_reader :router

  def initialize
    @router = Router.new(ROUTES)
  end

  def call(env)
    result = @router.resolve(env)
    [result.status, result.headers, result.body]
  end

  def self.root
    File.dirname(__FILE__)
  end
end

routes_path = File.join(App.root, 'app', 'routes.yml')
routes_config = File.read(routes_path)
ROUTES = YAML.safe_load(routes_config)

require './initializer'
