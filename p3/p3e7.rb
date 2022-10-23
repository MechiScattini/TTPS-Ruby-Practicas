=begin
Suponé que tenés el siguiente script y se te pide que lo hagas resiliente (tolerante a fallos), in‐
tentando siempre que se pueda recuperar la situación y volver a intentar la operación que falló.
Realizá las modificaciones que consideres necesarias para lograr que este script sea más robus‐
to.
=end

# Este script lee una secuencia de no menos de 15 números desde
#teclado y luego imprime el resultado de la división
# de cada número por su entero inmediato anterior.
# Como primer paso se pide al usuario que indique la cantidad de números que ingresará.

#require './p3e8.rb'

cantidad = 0
begin
	while cantidad < 15
	puts 'Cuál es la cantidad de números que ingresará? Debe ser al menos 15'
	cantidad = Integer(gets)
	end
rescue ArgumentError
	puts 'Tenés que poner un número entero salame, vamo devuelta...'
	#raise InvalidInputValueError
	retry
end
# Luego se almacenan los números
begin
	numeros = 1.upto(cantidad).map do
		puts 'Ingrese un número'
		numero = Integer(gets)
	end
rescue ArgumentError
	puts 'Rompiste todo... tenés que poner números enteros salame, va devuelta...'
	retry
end
# Y finalmente se imprime cada número dividido por su número entero
#inmediato anterior
resultado = numeros.map { |x| x / (x - 1) }
puts 'El resultado es: %s' % resultado.join(', ')
