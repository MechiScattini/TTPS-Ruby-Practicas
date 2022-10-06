module Countable

	COUNT = Hash.new(0)

	module ClassMethods

		def count_invocations_of(sym)
			# defino un nuevo nombre para el metodo
			new_name = (sym.to_s + "_new").to_sym
			# cambio el nombre del metodo original (sym) por el nuevo nombre
			alias_method new_name, sym
			# defino un método que cuando se llame a sym, contabilize en count y despues llame al sym original
			define_method(sym) { COUNT[sym]+=1; new_name }

		end

	end

	def self.included(base)
		base.extend(ClassMethods)
	end

	def invoked?(sym)
    COUNT[sym] >= 1 ? true : false
	end

  def invoked(sym)
  	COUNT[sym]
	end

end

class Greeter
  	include Countable # Incluyo el Mixin

  	def hi
    		puts 'Hey!'
  	end

  	def bye
    		puts 'See you!'
  	end

# Indico que quiero llevar la cuenta de veces que se invoca el método
#hi
  	count_invocations_of :hi

end

a = Greeter.new
b = Greeter.new

puts a.invoked? :hi
# => false
puts b.invoked? :hi
# => false
puts a.hi
# Imprime "Hey!"
puts a.invoked :hi
# => 1
puts b.invoked :hi
# => 0
