def tiempo_en_palabras(t)
	prefix = t.hour == 1 ? "Es la " : "Son las "
	prefix2 = t.hour == 0 ? "Es la " : "Son las "
	prefix3 = t.hour == 0 ? "Casi es la " : "Casi son las "
	case t.min
	when 0..10
			return prefix + t.hour + " en punto"
	when 11..20
		return prefix + t.hour + " y cuarto"
	when 21..34
		return prefix + t.hour + " y media"
	when 35..44
		return prefix2 + (t.hour + 1).to_s + " menos veinticinco"
	when 45..55
		return prefix2 + (t.hour + 1).to_s + " menos cuarto"
	when 56..59
		return prefix3 + (t.hour + 1).to_s
	end
end
