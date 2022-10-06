def multiplos_de_3_y_5(n)
	(1..n).select{ | i | i.modulo(3).zero? && i.modulo(5).zero? }.sum
end