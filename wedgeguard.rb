require 'system_timer'

class WedgeGuard
	def initialize(app, timeout=30)
		@app = app
		@timeout = timeout
	end

	def call(env)
		SystemTimer.timeout_after(@timeout) do
			begin
				@app.call(env)
			rescue Timeout::Error
				[ 504, {"Content-Type"=>"text/html"}, StringIO.new("<h1>Request Timeout</h1>") ]
			end
		end
	end
end

