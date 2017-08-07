class HomeController < Controller
  def index
    self.status = 200
    self.headers = { 'Content-Type' => 'text/html' }
    self.body = [template.render(self)]
  end
end
