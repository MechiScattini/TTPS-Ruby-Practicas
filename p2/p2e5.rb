def cuanto_falta? (time=Time.new(Time.now.year, Time.now.month, Time.now.day, 23, 59, 59))
	puts "Faltan " + (((time - Time.now) / 60).round).to_s + " minutos" 
end