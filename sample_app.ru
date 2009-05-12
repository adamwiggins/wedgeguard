require 'wedgeguard'

use WedgeGuard, :timeout => 1 #, :html => '<h1>That request timed out</h1>'

run lambda { |env|
	system "sleep 2"
	[ 200, {"Content-Type" => "text/plain"}, StringIO.new("hello\n") ]
}

