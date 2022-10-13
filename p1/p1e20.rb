class MiClase

  def initialize
    @var_ins_1 = "var_ins_1"
    @var_ins_2 = "var_ins_2"
  end

  def method1
    puts "method1"
  end

  def method2
    puts "method2"
  end

end

o = MiClase.new

puts "Clase:"
puts o.class #clase de o
puts "--------------------------------------"

puts "Superclases:"
puts o.class.ancestors #super clase de clase de o
puts "--------------------------------------"

puts "Lista de metodos de clase:"
puts o.class.methods #lista metodos clase
puts "--------------------------------------"

puts "Lista de metodos de instancia de clase:"
puts o.methods #lista metodos de instancia de clase
puts "--------------------------------------"

puts "Variables de intancia de clase:"
puts o.instance_variables
puts "--------------------------------------"

puts "Get instance var value:"
puts o.instance_variable_get(:@var_ins_1)
puts "--------------------------------------"

puts "Set instance var value:"
puts o.instance_variable_set(:@var_ins_1, "new_val")
puts "Nuevo valor:"
puts o.instance_variable_get(:@var_ins_1)
puts "--------------------------------------"
