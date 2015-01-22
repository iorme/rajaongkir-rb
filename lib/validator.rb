class Validator
	attr_accessor :errors, :rules

	def initialize(obj)
		@rules ||= {}
		@errors ||= {}
		@obj = obj
	end

	def rule(field, rule)
		if ! rule.nil?
			@rules[field] = rule
		end
	end

	def valid?
		valid = true
		@rules.each_pair do |f,r|
			if @obj.send(f)
				valid = false
				@errors[f] = "tidak boleh kosong"
			end
		end

		@valid = valid
	end

	def not_empty(value)
		! (value.nil? || value.empty?)	
	end
end