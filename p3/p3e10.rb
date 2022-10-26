=begin
Implementá un método que reciba dos parámetros: un String que representa la ruta a un ar‐
chivo y un bloque. El método deberá abrir el archivo indicado, leer su contenido
y procesar cada linea del mismo con el bloque recibido, imprimiendo a la salida
estándar el resultado de cada invocación al bloque.
Considerá qué posibles excepciones pueden ocurrir, intentá manejarlas,
y en caso que la ejecución del bloque falle para alguna de las líneas,
en el lugar que iría la salida de la ejecución fallida deberá imprimirse
Error encontrado: mensaje de error (ClaseDelError). Finalmente,
el método deberá retornar la cantidad de líneas procesadas correctamente.
=end

def procesar_archivo(path)
	cont = 0
	begin
		f = File.open(path)
		f.readlines.each do |line|
			begin
				puts yield line
			rescue => e
				puts "Error encontrado: #{e.message} (#{e.class.to_s})"
			else
				cont += 1
			end
		end
	rescue => e
		puts "Error encontrado: #{e.message} (#{e.class.to_s})"
	end
	cont
end

puts procesar_archivo('./datos.txt') { |linea| Integer(linea) }
