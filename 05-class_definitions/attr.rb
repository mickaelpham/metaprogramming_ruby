class MyClass
  def my_attribute=(value)
    @my_attribute = value
  end

  def my_attribute
    @my_attribute
  end
end

obj = MyClass.new
obj.my_attribute = 'x'
puts obj.my_attribute # => "x"

# Writing methods like these (also called _accessors_) gets boring quickly. As
# an alternative, you can generate accessors by using one of the methods in the
# `Module#attr_*` family.

class MySecondClass
  attr_accessor :my_attribute
end

second_obj = MySecondClass.new
second_obj.my_attribute = 'x'
puts second_obj.my_attribute # => "x"
