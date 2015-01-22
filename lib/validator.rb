class Validator
	attr_accessor :errors, :rules

	def initialize(obj)
		@rules ||= {}
		@errors ||= {}
		@obj = obj

		# message error
		@message = {
			:not_empty => "tidak boleh kosong",
			:not_null => "harus lebih besar dari 0"
			}
	end

	# menambahkan aturan validasi
	def rule(field, rule)
		if ! rule.nil?
			@rules[field] = rule
		end
	end

	# cek apakah object valid atau tidak
	def valid?
		valid = true
		@rules.each_pair do |f,r|
			if ! send(r.to_sym, @obj.send(f))
				valid = false
				@errors[f] = @message[r]
			end
		end

		@valid = valid
	end

	# tidak boleh kosong
	def not_empty(value)
	 	! (value.nil? || value == "")	
	end

	# tidak boleh 0
	def not_null(value)
		! (value == 0)
	end
end