require 'pp'

v1 = 1

class MyClass
  v2 = 2
  pp local_variables # => [:v2]

  def my_method
    v3 = 3
    pp local_variables
  end

  pp local_variables
end

obj = MyClass.new
obj.my_method # => [:v3]
obj.my_method # => [:v3]

pp local_variables # => [:v1, :obj]
