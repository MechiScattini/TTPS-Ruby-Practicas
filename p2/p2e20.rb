
class Array

	def randomly(&block)
		block ? block.call(self.shuffle) : self.shuffle.lazy
	end

end
