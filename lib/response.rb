class Response
	attr_accessor :code, :body, :raw_body

	def initialize data
		@code = data['code']
		@body = data['body']
		@raw_body = data['body'].to_json
	end
end