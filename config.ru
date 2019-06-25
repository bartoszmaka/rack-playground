require_relative 'hello'
require_relative 'logger'
require_relative 'auth_middleware'

use Logger
use AuthMiddleware
run Hello.new
