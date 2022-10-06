def metodo(*args, &block)
	block.call(*args)
	rescue RuntimeError
		puts "Hay algo mal que no anda bien"
		:rt
	rescue NoMethodError => nME
		puts "Y este método?" + nME.message
		:nm
	rescue
		puts "Y ahora?"
		raise
	else
		:ok
end

# imprime 2,3,4, devuelve :ok
metodo(2,3,4) { | x, y, z | puts x; puts y; puts z }

# imprime: "y este metodo? ...", devuelve :nm
metodo(2,3,4) { | x | x.each { | elem | puts elem } }

# imprime: "Hay algo mal que no anda bien", devuelve :rt
metodo() { raise RuntimeError }
