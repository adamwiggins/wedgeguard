require 'system_timer'

class WedgeGuard
	def initialize(app, options={})
		@app = app
		@timeout = options[:timeout] || 30
		@html = options[:html] || "<h1>Request timeout<h1>"
	end

	def call(env)
		SystemTimer.timeout_after(@timeout) do
			begin
				@app.call(env)
			rescue Timeout::Error
				[ 504, {"Content-Type"=>"text/html"}, StringIO.new(@html) ]
			end
		end
	end
end

