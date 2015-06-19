require 'pp'

class MyClass
  def initialize
    @v = 1
  end
end

obj = MyClass.new

obj.instance_eval do
  pp self # => #<MyClass:0x007f8fddb32b70 @v=1>
  pp @v   # => 1
end

v = 2
obj.instance_eval { @v = v } # this block can see the bindings from `self`
obj.instance_eval { pp @v } # => 2
