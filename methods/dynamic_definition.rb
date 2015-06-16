class MyClass
  define_method :my_method do |my_arg|
    my_arg * 3
  end
end

obj = MyClass.new
obj.my_method(2) # => 6

# This technique of defining a method at runtime is called a _dynamic method_.
# There is one important reason to use `define_method` over the more familiar
# `def` keyword: `define_method` allows you to decide the name of the defined
# method at runtime.
