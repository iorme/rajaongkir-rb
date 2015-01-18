class Response
	attr_accessor :code, :content, :headers

	def initialize data
		@code = data['code']
		@content = data['body']
		@headers = data['headers']
	end
end