require 'pp'

class MyClass
  @my_var = 1

  def self.read
    @my_var
  end

  def write
    @my_var = 2
  end

  def read
    @my_var
  end
end

obj = MyClass.new

pp obj.read     # => nil
obj.write

pp obj.read     # => 2
pp MyClass.read # => 1

# In a class definition, the role of `self` belongs to the class itself, so the
# instance variable `@my_var` balongs to the class. Don't get confused. Instance
# variables of the class are *different* from instance variables of that class's
# objects.
