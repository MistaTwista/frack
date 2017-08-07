class Controller
  attr_reader :name, :action
  attr_accessor :status, :headers, :body

  def initialize(name: nil, action: nil, env: nil)
    @req = Rack::Request.new(env)
    @name = name
    @action = action
  end

  def call
    send(action)
    self
  end

  def not_found
    self.status = 404
    self.headers = {}
    self.body = ['Nothing found']
    self
  end

  def internal_error
    self.status = 500
    self.headers = {}
    self.body = ['Internal error']
    self
  end

  private

  def template
    template_file = File.join(App.root, 'app', 'views', name, "#{action}.haml")
    Haml::Engine.new File.read(template_file)
  end
end
