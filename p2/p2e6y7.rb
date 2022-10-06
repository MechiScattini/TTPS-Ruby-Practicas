class Documento
  attr_accessor :creador, :contenido, :publico, :borrado

  def initialize(usuario, publico = true, contenido = '')
    self.creador = usuario
    self.publico = publico
    self.contenido = contenido
    self.borrado = false
  end

  def borrar
    self.borrado = true
  end

  def puede_ser_visto_por?(usuario)
    usuario.puede_ver? self
  end

  def puede_ser_modificado_por?(usuario)
    usuario.puede_modificar? self
  end

  def puede_ser_borrado_por?(usuario)
    usuario.puede_borrar? self
  end

end

module ToString
  def to_s
    "#{self.email} (#{self.rol.class})"
  end
end

class User
  attr_accessor :user, :password, :email, :rol

  include ToString

  def initialize(user, password, email, rol)
    self.user = user
    self.password = password
    self.email = email
    self.rol = rol
  end

  def puede_ver?(doc)
    rol.puede_ver? doc
  end

  def puede_modificar?(doc)
    rol.puede_modificar? doc, self
  end

  def puede_borrar?(doc)
    rol.puede_borrar? doc
  end

end

class Rol

  def puede_ver?(doc)
    false
  end

  def puede_modificar?(doc, user)
    false
  end

  def puede_borrar?(doc)
    false
  end

end

class Lector < Rol

  def puede_ver?(doc)
    doc.publico ? true : false
  end

end

class Redactor < Lector

  def puede_modificar?(doc, user)
    if doc.creador == user
      true
    else
      false
    end
  end

end

class Director < Rol

  def puede_ver?(doc)
    true
  end

  def puede_modificar?(doc, user)
    doc.borrado ? false : true
  end

end

class Administrador < Director

  def puede_borrar?(doc)
    true
  end

end

lector = User.new("lector", "lector123", "lector@mail.com", Lector.new())
redactor = User.new("redactor", "redactor123", "redactor@mail.com", Redactor.new())
director = User.new("director", "director123", "director@mail.com", Director.new())
admin = User.new("admin", "admin123", "admin@mail.com", Administrador.new())


doc_publico_lector = Documento.new(usuario=lector, contenido="esto es un doc publico")
doc_privado_lector = Documento.new(usuario=lector, publico=false, contenido="esto es un doc privado")
doc_publico_redactor = Documento.new(usuario=redactor, contenido="esto es un doc publico")

# librerías de unit testing quien te conoce
puts "Unit test caseritos"
puts "Tests puede ser visto por para doc publico:"
puts "deberia dar 4 true"
puts doc_publico_lector.puede_ser_visto_por?(lector)
puts doc_publico_lector.puede_ser_visto_por?(redactor)
puts doc_publico_lector.puede_ser_visto_por?(director)
puts doc_publico_lector.puede_ser_visto_por?(admin)

puts ""
puts "Tests puede ser visto por para doc privado:"
puts "deberia dar false false true true"
puts doc_privado_lector.puede_ser_visto_por?(lector)
puts doc_privado_lector.puede_ser_visto_por?(redactor)
puts doc_privado_lector.puede_ser_visto_por?(director)
puts doc_privado_lector.puede_ser_visto_por?(admin)

puts ""
puts "Tests puede ser modificado por para doc publico:"
puts "deberia dar false false true true true"
puts doc_publico_lector.puede_ser_modificado_por?(lector)
puts doc_publico_lector.puede_ser_modificado_por?(redactor)
puts doc_publico_redactor.puede_ser_modificado_por?(redactor)
puts doc_publico_lector.puede_ser_modificado_por?(director)
puts doc_publico_lector.puede_ser_modificado_por?(admin)

puts ""
puts "Tests puede ser modificado por para doc privado:"
puts "deberia dar false false true true"
puts doc_privado_lector.puede_ser_modificado_por?(lector)
puts doc_privado_lector.puede_ser_modificado_por?(redactor)
puts doc_privado_lector.puede_ser_modificado_por?(director)
puts doc_privado_lector.puede_ser_modificado_por?(admin)


puts ""
puts "Tests puede ser borrado por para doc publico:"
puts "deberia dar false false false true"
puts doc_publico_lector.puede_ser_borrado_por?(lector)
puts doc_publico_lector.puede_ser_borrado_por?(redactor)
puts doc_publico_lector.puede_ser_borrado_por?(director)
puts doc_publico_lector.puede_ser_borrado_por?(admin)

puts ""
puts "Users to_s"
puts lector.to_s
puts redactor.to_s
puts director.to_s
puts admin.to_s
