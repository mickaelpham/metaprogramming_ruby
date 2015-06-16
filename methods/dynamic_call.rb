class MyClass
  def my_method(my_arg)
    my_arg * 2
  end
end

obj = MyClass.new
obj.my_method(3) # => 6

# You also have an alternative:
obj.send(:my_method, 3) # => 6

# With `send`, the name of the method that you want to call becomes just a
# regular argument. You can wait literally until the very last moment to decide
# which method to call, _while_ the code is running.
