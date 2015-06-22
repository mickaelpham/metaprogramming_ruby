# Challenge: play _Taboo_ with Ruby code. You have only one taboo word, the
# `class` keyword. Your "secret word" is actually a Ruby class:
#
# class MyClass < Array
#   def my_method
#     'Hello!'
#   end
# end

c = Class.new(Array) do
  def my_method
    'Hello!'
  end
end

test = c.new
puts test.my_method

# You can also assign the name yourself
MyClass = c

# Interestingly, Ruby is cheating a little here. Now the constant references the
# `Class`, and the `Class` also references the constants.

puts c.name # => "MyClass"
