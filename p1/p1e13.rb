def listar (hash)
	hash.each_with_index.inject(""){ |acc, (elem,i)|  acc+= (i+1).to_s + "." + elem[0].to_s + ": " + elem[1].to_s + "\n"}
end