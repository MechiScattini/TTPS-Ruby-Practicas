
class Array

	def randomly(&block)
		block ? block.call(self.shuffle.uniq) : self.shuffle.lazy
	end

end
