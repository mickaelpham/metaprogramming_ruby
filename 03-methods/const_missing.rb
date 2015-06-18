require 'pp'

# We define M::MyClass here
module M
  class MyClass; end
end

# Override const_missing from Module
# Source http://stackoverflow.com/questions/4470108/when-monkey-patching-a-method-can-you-call-the-overridden-method-from-the-new-i
class Module
  old_const_missing = instance_method(:const_missing)

  define_method(:const_missing) do |const_name|
    case const_name
    when :MyClass
      puts "Warning: using deprecated constant #{const_name}"
      M::MyClass
    else
      old_const_missing(const_name)
    end
  end
end

my_class = MyClass
pp my_class

my_task = Task # Should fail with the previous constant missing method
