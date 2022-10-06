class NoEsUnaPalabra < StandardError
end

class EsUnStringVacio < StandardError
end

class Palabra
	attr_accessor :str
	def initialize(str)

		if str.match(/^[\s]$/) or str.empty?
			raise EsUnStringVacio, "Es un string vacio", caller
		elsif !str.match(/[\w]+/) or str.match(/[\s]/)
			raise NoEsUnaPalabra, "#{str} no es una palabra", caller
		end

		@str = str

	end

	def vocales
		@str.scan(/[a,e,i,o,u]/).uniq
	end

	def consonantes
		@str.scan(/[^a,e,i,o,u]/).uniq
	end

	def longitud
		@str.length
	end

	def es_panvocalica?
		@str.scan(/[a,e,i,o,u]/).uniq.count == 5
	end

	def es_palindroma?
		if @str.length  >2
			@str == @str.reverse
		else
			false
		end
	end

	def gritando
		@str.upcase
	end

	def en_jaquer
		@str.gsub(/[a,A]/,"4").gsub(/[e,E]/,"3").gsub(/[i,I]/,"1").gsub(
	/[o,O]/,"0").gsub(/[u,U]/,"6")
	end

end
