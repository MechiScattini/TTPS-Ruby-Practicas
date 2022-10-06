def multiplos_de(arr, n)
	(1..n).select{ | i | arr.map{ |elem| i.modulo(elem).zero? }.all? }.sum
end

