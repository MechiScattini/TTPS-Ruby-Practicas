#!/usr/bin/env ruby

# Ejercicio 2: cache.rb
#
# Modelá una estructura llamada `Cache` que se utilizará como un sistema de caché de
# elementos de cualquier tipo. Los valores almacenados en la caché tendrán un tiempo de
# validez de 3 segundos, pasados los cuales se considerarán expirados. Los valores
# expirados deberán ser removidos de la cache´ al detectar que ya no son válidos.
#
# La definición de la clase debe responder a los siguientes métodos:
#  - cargar(clave, valor): guarda `valor` en la clave `clave` y registra el timestamp
#                          actual de la operación, para saber cuánto tiempo lleva en la
#                          cache ese valor.
#  - expirada?(clave): retorna un valor booleano indicando si la clave `clave` ha expirado.
#  - entradas: devuelve las claves válidas (que no hayan expirado) almacenadas en la cache.
#  - valor_de(clave): busca y retorna el valor asociado a la `clave` que se pasa como
#                     parámetro. Si la clave está expirada, debe removerla de la caché y
#                     retornar `nil`.
#  - `remover(clave)`: elimina la entrada de la caché que se identifica por `clave`.
#
# Además de implementar la caché, en el ejercicio `02_mixin.rb` la deberás deberás utilizar
# para resolver ese ejercicio.
#
# Tips:
#   * Para obtener un timestamp actual podes utilizar `Time.now.to_i`.
#   * Para simular el paso del tiempo, podés utilizar el método `sleep`.
#   * Analizá si conviene modelar los métodos de la caché como métodos de instancia o de clase.

class Cache
    attr_accessor :elementos, :timestamps

    @elementos = Hash.new(0)
    @timestamps = Hash.new(0)

    def initialize()
        self.elementos = Hash.new(0)
        self.timestamps = Hash.new(0)
    end


    def cargar(clave,valor)
        self.elementos[clave] = valor
        self.timestamps[clave] = Time.now.to_i
    end

    def expirada?(clave)
        (Time.now - self.timestamps[clave]).to_i > 3
    end

    def entradas
        self.elementos.select { | key, value | !expirada?(key)}
    end

    def valor_de(clave)
        if expirada?(clave)
            remover(clave)
            nil
        else
            self.elementos[clave]
        end
    end

    def remover(clave)
        self.elementos.delete(clave)
    end

end