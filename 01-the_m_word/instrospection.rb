require 'pp'

class Greeting
  def initialize(text)
    @text = text
  end

  def welcome
    @text
  end
end

# Defined a Greeting class and created a Greeting object
my_object = Greeting.new("Hello")

# Now we can ask them questions
pp my_object.class # => Greeting

# Show instance methods that are NOT inherited
pp my_object.class.instance_methods(false) # => [:welcome]

# Show instance variables
pp my_object.instance_variables # => [:@text]
