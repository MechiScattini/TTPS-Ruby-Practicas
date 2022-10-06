def rot13(s)
	$alfa_may = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
	$alfa_min = "abcdefghijklmnopqrstuvwxyz"
	s.each_char.inject("") do |acc, c|
		if c.match(/^[[:alpha:]]$/)
	        	if /[[:upper:]]/.match(c)
	        		alfa = $alfa_may
	        		limite = 65
	      		else
	        		alfa = $alfa_min
	        		limite = 97
	      		end
	      		new_pos = (c.ord - limite + 13) % alfa.size 
	      		acc += alfa[new_pos]
	    	else
	      		acc += c
	    	end
  	end
end
