require 'wedgeguard'

use WedgeGuard, 1

run lambda { |env|
	system "sleep 2"
	[ 200, {"Content-Type" => "text/plain"}, StringIO.new("hello\n") ]
}

