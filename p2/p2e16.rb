def procesar_hash(hash, proc)
	# primera solucion saqué de internet, despues logré hacerlo como pensaba yo con el inject, ambas funcionan
	#Hash[ *hash.map { | key, value| [ value, proc.call(key)] }.flatten ]
	hash.inject({}) { | new_hash, (key,value) | new_hash[value] = proc.call(key); new_hash }
end

hash = { 'clave' => 1, :otra_clave => 'valor' }
puts procesar_hash(hash, ->(x) { x.to_s.upcase })
