#Analizá y probá los siguientes métodos, que presentan una lógica similar, pero ubican el manejo
#de excepciones en distintas partes del código. ¿Qué resultado se obtiene en cada caso? ¿Por
#qué?

def opcion_1
		a = [1, nil, 3, nil, 5, nil, 7, nil, 9, nil]
		b = 3
		c = a.map do |x|
			x * b
		end
		puts c.inspect
	rescue
		0
end

def opcion_2
	c = begin
			a = [1, nil, 3, nil, 5, nil, 7, nil, 9, nil]
			b = 3
			a.map do |x|
				x * b
			end
		rescue
			0
		end
	puts c.inspect
end

def opcion_3
	a = [1, nil, 3, nil, 5, nil, 7, nil, 9, nil]
	b = 3
	c = a.map { |x| x * b } rescue 0
	puts c.inspect
end

def opcion_4
	a = [1, nil, 3, nil, 5, nil, 7, nil, 9, nil]
	b = 3
	c = a.map { |x| x * b rescue 0 }
	puts c.inspect
end

puts opcion_1
# imprime 0, al momento de hacer el a.map, en la segunda iteración cuando intenta hacer
# nil * 3 lanza una excepción la cual es catcheada por el rescue que devuelve 0 y finaliza la ejecución
# el c.inspect nunca se llega a ejecutar porq se encuentra entre el código q tira error y el rescue

puts opcion_2
# también imprime 0, por el mismo error, la excepcion es catcheada, se devuelve 0 y luego imprime c.inspect que tiene nil

puts opcion_3
# sería igual que la opcion_1 solo que el c.inspect está después del rescue asiq se ejecuta pero al tener "nil" no se ve nada

puts opcion_4
# aca es diferente porq el rescue le devuelve el valor 0 al map asiq ese valor se guarda en c cada vez que ocurre una excepción
# por esto luego el c.inspect imprime [3, 0, 9, 0, 15, 0, 21, 0, 27, 0]
