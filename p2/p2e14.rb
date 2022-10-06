VALUE = 'global'

module A
	VALUE = 'A'

	class B
		VALUE = 'B'

		def self.value
			VALUE
		end

		def value
			'iB'
		end
	end

	def self.value
		VALUE
	end

end

class C

	class D
		VALUE = 'D'

		def self.value
			VALUE
		end
	end

	module E

		def self.value
			VALUE
		end
	end

	def self.value
		VALUE
	end
end

class F < C
	VALUE = 'F'
end

#1.
# devuelve "A" porque está pidiendo la variable del modulo que devuelve el getter
puts A.value

# devuelve "B" porque le está pidiendo el valor a la clase B del modulo A
puts A::B.value

# devuelve "D", le está pidiendo el valor de value a la clase D dentro de C
puts C::D.value

# devuelve "global", le pide al modulo de C el value que C no tiene, usa la variable global
puts C::E.value

# devuelve "global" porque F no tiene definido un getter para su variable????
puts F.value

# 2.
# imprime A, le pide al modulo el valor de su variable y se obtiene con su getter
puts A::value

# Tira error porque A es un modulo, no se puede instanciar
#puts A.new.value

# no se si se puede acceder a una clase dentro de un modulo sin pasar por el modulo xd
# uninitialized constant B ??
#puts B.value

# Imprime "D" porque D tiene getter, esto está repetido
puts C::D.value

# imprime "global" porque C tiene getter pero no tiene definida la variable Value
puts C.value

# sería como la sentencia de arriba, imprime "global"
puts F.superclass.value
