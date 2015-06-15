require 'pp'

class MyClass
  def my_method
    "original my_method()"
  end

  def another_method
    my_method
  end
end

module MyClassRefinement
  refine MyClass do
    def my_method
      "refined my_method()"
    end
  end
end

using MyClassRefinement
pp MyClass.new.my_method       # => "refined my_method()" as expected
pp MyClass.new.another_method  # => "original my_method()" wtf?
