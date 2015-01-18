class Response
	attr_accessor :code, :body, :headers

	def initialize data
		@code = data['code']
		@body = data['body']
		@headers = data['headers']
	end
end