Los lazy enumerators son enumeradores que evalúan cada valor iterado uno a la vez, en vez de recorrer todo el iterador
Esto puede ser útil al momento de trabajar con grandes conjuntos de datos de los cuales se requieren un porción reducida
Ejemplo:
Querés quedarte con los primeros 10 usuarios de twitter que tengan @rails en el perfil, de 10000 usuarios que se tienen
con un enumerador normal sería:
twitter_user_ids = [..]
twitter_user_ids.map { |user_id| TwitterClient.user(user_id)}
	.select { |data| data[:description].includes?("@rails")}
	.first(10)

En este caso, se recorrió y filtró los 10000 usuarios y luego se quedó con los primeros 10

Podría evitarse el recorrer el conjunto completo utilizando un lazy iterator de la siguiente manera:
twitter_user_ids = [..]
twitter_user_ids.lazy
	.map { |user_id| TwitterClient.user(user_id)}
	.select { |data| data[:description].includes?("@rails")}
	.first(10)

Así solo se recorrió el conjunto hasta obtener a los primeros 10 users que cumplan la condición
