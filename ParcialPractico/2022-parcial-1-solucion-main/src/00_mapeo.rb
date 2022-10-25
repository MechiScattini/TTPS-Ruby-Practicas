#!/usr/bin/env ruby

# Ejercicio 1: mapeo.rb
#
# Implementá un método llamado `mapeo` que acepte un número indeterminado de parámetros y
# retorne una estructura que contenga claves y valores donde cada clave será el índice del
# parámetro dentro del conjunto de parámetros que haya recibido el método, y cada valor
# será el resultado de multiplicar la longitud de la representación en String del parámetro
# por la cantidad de parámetros recibidos y por el índice del parámetro.

def mapeo(*args)
  hash = {} # Hash.new
  args.each_with_index do |e, i|
    hash[i] = e.to_s.length * i * args.length
  end
  hash
end

# Por ejemplo, la siguiente invocación:
puts '* Invocando: mapeo(100, 2.501, :ttps_ruby_2022, { parcial: true, practicas: [1, 2] }, [0, 3, 0, 3], nil, true, false)'
resultado = mapeo(100, 2.501, :ttps_ruby_2022, { parcial: true, practicas: [1, 2] }, [0, 3, 0, 3], nil, true, false)
# Debería retornar:
correcto = resultado == { 0 => 0, 1 => 40, 2 => 224, 3 => 864, 4 => 384, 5 => 0, 6 => 192, 7 => 280 }

# Validación para que puedas verificar este caso de prueba (NO IMPLICA QUE EL EJERCICIO ESTÉ APROBADO)
if correcto
  puts '¡Muy bien, tu implementación arroja un resultado correcto!'
else
  puts 'Ups.. Tu resolución no funciona aún. ¡Seguí intentando!'
  puts "El resultado que arrojó es:\n#{resultado.inspect}"
end
