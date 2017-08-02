class HomeController < Controller
  def index
    content = 'Here is some content at #index'
    arr = %w[uno dos tres]
    self.status = 200
    self.headers = { 'Content-Type' => 'text/html' }
    self.body = [content, *arr, @req.path]
  end
end
