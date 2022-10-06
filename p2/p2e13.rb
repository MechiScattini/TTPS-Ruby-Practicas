module Oposite

	def opposite()
		!self
	end

end

class TrueClass

	include Oposite
	
end

class FalseClass

	include Oposite

end
