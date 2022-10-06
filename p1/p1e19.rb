def notacion_hexadecimal (arr)
  # 2 opciones:
  "#" + arr.map{ |i| format("%02X",i) }.join
  arr.inject("#") { |acc, i| acc += format("%02X",i)}
end

def notacion_entera(arr)
  # tambien 2 formas de hacerlo, la segunda es un poco confusa
  arr.map.with_index { | elem, i | elem * 256.pow(i) }.sum
  arr.each.with_index.inject(0) { | acc, (elem, i) | acc += elem * 256.pow(i) }
end
