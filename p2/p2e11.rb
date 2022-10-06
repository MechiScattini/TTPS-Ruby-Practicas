class GenericFactory

	def self.create(*args)
		new(*args)
	end

	def initialize(*args)
		raise NotImplementedError
	end

end

class Factory1 < GenericFactory
	
	def initialize(*args)
		args.each_with_index do |value, index|
    			instance_variable_set("@var_#{index}", value)
  		end
	end
	
end