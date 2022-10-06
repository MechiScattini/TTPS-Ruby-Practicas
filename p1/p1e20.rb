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

puts "clase"
o.class #clase de o

puts "superclase"
o.class.superclass #super clase de clase de o

puts "lista de metodos de clase"
o.class.methods #lista metodos clase

puts "lista de metodos de instancia de clase"
o.methods #lista metodos de instancia de clase

puts "variables de intancia de clase"
o.instance_variables

puts "get isntance var value"
o.instance_variable_get(:@var_ins_1)

puts "set instance var value"
o.instance_variable_set(:@var_ins_1, "new_val")
