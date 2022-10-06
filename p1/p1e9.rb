def string_reverso(s)
  s.reverse
end

def string_sin_espacio(s)
  s.delete(" ")
end

def string_a_arreglo_ascii(s)
  s.split.map {|w| w.chars.map { |char| char.ord }}.flatten
end

def string_reemplaza_vocal(s)
  s.gsub(/[a,A]/,"4").gsub(/[e,E]/,"3").gsub(/[i,I]/,"1").gsub(
/[o,O]/,"0").gsub(/[u,U]/,"6")
end
