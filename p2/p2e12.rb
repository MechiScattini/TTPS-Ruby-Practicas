module GenericFactory
	module ClassMethods
		def create(*args)
			new(*args)
		end
	end

	def self.included(base)
		base.extend(ClassMethods)
	end

	def initialize(*args)
		raise NotImplementedError
	end

end

class Factory1
		
	include GenericFactory

	def initialize(*args)
		args.each_with_index do |value, index|
    			instance_variable_set("@var_#{index}", value)
  		end
	end
	
end