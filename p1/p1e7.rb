def contar(s1, s2)
  s1.downcase.scan(s2.downcase).size
end
