require 'pp'

# We define M::MyClass here
module M
  class MyClass; end
end

# Override const_missing from Module
class Module
  alias_method :old_const_missing, :const_missing

  def const_missing(const_name)
    case const_name
    when :MyClass
      puts "Warning: using deprecated constant #{const_name}"
      M::MyClass
    else
      old_const_missing const_name
    end
  end
end

my_class = MyClass
pp my_class

my_task = Task # Should fail with the previous constant missing method
