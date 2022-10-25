#!/usr/bin/env ruby

# Ejercicio 3: mixin.rb
#
# Implementá un mixin llamado `Cacheable` que permita a cualquier clase agregarle la
# lógica necesaria para almacenar sus instancias en la caché implementada en el ejercicio
# `01_cache.rb`.
#
# Las clases en las que se quiera incorporar el mixin deberán implementar el método de
# instancia `clave_cache` que retorna una clave (String) compuesta por el nombre de la
# clase y un identificador único que debe tener cada instancia. Con ese método implementado
# podrán hacer uso del mixin y así incorporar los siguientes métodos:
#   - cachear: método de instancia que almacena el objeto en la caché utilizando su clave
#              (la cual se obtiene mediante el método `clave_cache` antes mencionado).
#   - limpiar_cache: método de instancia que remueve la entrada asociada a la clave de la
#                    caché.
#   - cacheada?: método de instancia que retorna un booleano indicando si la instancia está
#                cacheada y no ha expirado.
#   - limpiar_cache: método de clase que remueve todas las entradas de la caché
#                    correspondientes a la clase. Tip: iterar sobre las claves de la caché
#                    y remover las que correspondan al nombre de la clase.
#
# Además de implementar el mixin, deberás utilizarlo en el cuerpo principal de este script
# invocando los métodos (de instancia y de clase) que éste le provee a las clases que lo
# incluyan.

# Incorporar dependencias acá
require_relative '01_cache'

# Implementar mixin Cacheable acá
module Cacheable
  def cache
    Cache.instancia
  end

  def cachear
    cache.cargar(clave_cache, self)
  end

  def limpiar_cache
    cache.remover(clave_cache)
  end

  def cacheada?
    !cache.expirada?(clave_cache)
  end

  module MetodosDeClase
    def cache
      Cache.instancia
    end

    def limpiar_cache
      cache.entradas
          .select { |clave| clave.start_with?(name) }
          .each { |clave| cache.remover(clave) }
    end
  end

  def self.included(klass)
    klass.extend MetodosDeClase
  end
end

class Avion
  include Cacheable

  attr_accessor :matricula, :modelo

  def initialize(matricula, modelo)
    self.matricula = matricula
    self.modelo = modelo
  end

  def clave_cache
    "#{self.class.name}_#{matricula}"
  end
end

class Persona
  include Cacheable

  attr_accessor :dni, :nombre, :apellido

  def initialize(dni, nombre, apellido)
    self.dni = dni
    self.nombre = nombre
    self.apellido = apellido
  end

  def clave_cache
    "#{self.class.name}_#{dni}"
  end
end

# Implementar código principal acá
