require 'wedgeguard'

use WedgeGuard, 2
run lambda { |env| sleep 1; [ 200, {"Content-Type" => "text/plain"}, StringIO.new('hello') ] }

