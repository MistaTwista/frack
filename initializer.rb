def require_from(path)
  Dir[path].each { |file| require file }
end

require 'irb'

require_from File.join(File.dirname(__FILE__), 'lib', '*.rb')
require_from File.join(File.dirname(__FILE__), 'app', '**', '*.rb')
