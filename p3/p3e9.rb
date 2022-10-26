def fun3
	puts "Entrando a fun3"
	raise RuntimeError, "Excepción intencional"
	puts "Terminando fun3"
rescue NoMethodError => e
	puts "Tratando excepción por falta de método"
rescue RuntimeError => e
	puts "Tratando excepción provocada en tiempo de ejecución"
rescue
	puts "Tratando una excepción cualquiera"
ensure
	puts "Ejecutando ensure de fun3"
end

def fun2(x)
	puts "Entrando a fun2"
	fun3
	a = 5 / x
	puts "Terminando fun2"
end

def fun1(x)
	puts "Entrando a fun1"
	fun2 x
rescue
	puts "Manejador de excepciones de fun1"
	raise
ensure
	puts "Ejecutando ensure de fun1"
end

begin
	x = 0
	begin
		fun1 x
	rescue Exception => e
		puts "Manejador de excepciones de Main"
		if x == 0
			puts "Corrección de x"
			x = 1
			retry
		end
	end
	puts "Salida"
end

=begin
1. Seguí el flujo de ejecución registrando la traza de impresiones que deja el programa,
analizando por qué partes del código va pasando y justificando esos pasos.
=end
# Respuesta:
=begin
 x=0
 llama a fun1 => x = 0
 imprime "Entrando a fun1"
 llama a fun2 => x = 0
 imprime "Entrando a fun2"
 llama a fun3
 imprime "Entrando a fun3"
 raise "Excepción intencional" => catchea el segundo rescue de la fun3
 imprime "Tratando la excepcion provocada en tiempo de ejecución"
 ejecuta el ensure de la fun3
 imprime "Ejecutando ensure de fun3"
 finaliza fun3 y vuelve el control a fun2
 a = 5/x => produce ZeroDivisionError
 sale de fun2 buscando un rescue y lo encuentra en fun1
 entra al rescue, imprime "Manejador de excepciones de fun1"
 vuelve a hacer raise de ZeroDivisionError
 acá no se si entra al ensure o no --> efectivamen3, imprime "Ejecutando ensure de fun1"
 termina fun1 y sale la excepcion buscando rescue al Main
 captura el rescue de Main
 imprime "Manejador de excepciones de main"
 x == 0 => true
 imprime "Corrección de x"
 x = 1
 vuelve al segundo begin del main (llama a fun1 => x=1)
 imprime "Entrando a fun1"
 llama a fun2 => x=1
 imprime "Entrando a fun2"
 llama a fun3
 imprime "Entrando a fun3"
 raise RuntimeError
 cae en segundo rescue, imprime "Tratando excepcion provocada en tiempo de ejecución"
 imprime "Ejecutando ensure de fun3"
 vuelve a fun2
 a = 5/x => a = 5/1 = 5
 a = 5
 imprime "Terminando fun2"
 sale de fun2, vuelve a fun1
 ejecuta el ensure, imprime "Ejecutando ensure de fun1"
 termina fun1
 termina el bloque begin end del Main
 imprime "Salida"
=end

=begin
2. ¿Qué pasaría si se permuta, dentro de fun3, el manejador de excepciones para
RuntimeError y el manejador de excepciones genérico (el que tiene el rescue vacío)?
=end

=begin
Encontraría el manejador genérico primero y entraría ahí, por lo q imprimiría "Tratando una excepción cualquiera"
=end

=begin
3. ¿El uso de retry afectaría el funcionamiento del programa si se mueve la línea x = 0
dentro del segundo begin (inmediatamente antes de llamar a fun1 con x)?
sí, si x vale 0 cada vez q se ejecuta el programa, siempre va a tirar excepción y va a entrar en un loop infinito
=end
