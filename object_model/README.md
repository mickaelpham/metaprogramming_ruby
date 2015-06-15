The Object Model
================

### Open Class

The `class` keyword in Ruby is more like a scope operator than a class
declaration. You can always reopen existing classes—even standard library
classes such as `String` or `Array`—and modify them on the fly.

However, be careful about this kind of reckless patching of classes, since you
can quickly fall into the trap and _Monkeypatch_ some existing and important
methods!

### Instance Variables

Objects contain instance variable, you can peek at them by calling
`Object#instance_variables`.

### Methods

You can access and filter the list of methods on an object through:

```ruby
obj.methods.grep(/my/) # => [:my_method]
```

Also, make sure to refer to them as _instance methods_ (not just "a method" of
`MyClass`).

```ruby
String.instance_methods == "abc".methods # => true
String.methods == "abc".methods          # => false
```

### The truth about classes

```ruby
"hello".class # => String
String.class # => Class

# The "false" argument here means: ignore inherited methods
Class.instance_methods(false) # => [:allocate, :new, :superclass]

Array.superclass       # => Object
Object.superclass      # => BasicObject
BasicObject.superclass # => nil

# Take a deep breath
Class.superclass       # => Module
```

### The Paths of Constants

```ruby
module M
  class C
    X = 'a constant'
  end
  C::X # => "a constant"
end
M::C::X # => "a constant"

Y = 'a root-level constant'
module M
  Y = 'a constant in M'
  Y   # => "a constant in M"
  ::Y # => "a root-level constant"
end

M.constants                       # => [:C, :Y]
Module.constants.include? :Object # => true
Module.constants.include? :Module # => true

module M
  class C
    module M2
      Module.nesting # => [M::C::M2, M::C, M]
    end
  end
end
```

### Loading and Requiring

You can force an external program (e.g. `motd.rb`) to keep its constants to
itself by passing a second, optional argument to `load`:

```ruby
load('motd.rb', true)
```

If you load a file this way, Ruby creates an anonymous module, uses that module
as a Namespace to contain all the constants from `motd.rb`, and then destroys
the module.

What happens when you call a method?
------------------------------------

When you call a method, Ruby does two things:

1. It finds the method. This is a process called _method lookup_.
2. It executes the method. To do that, Ruby needs something called `self`.

### Method Lookup

The _receiver_ is the object that you call a method on. For example, if you
write `my_string.reverse()`, then `my_string` is the receiver.

To understand the concept of an _ancestors chain_, look at any Ruby class.
Then imagine moving from the class into its superclass, then into the
superclass's superclass, and so on, until you reach `BasicObject`, the root
of the Ruby class hierarchy. The path of classes you just traversed is the
ancestors chain of the class.

```ruby
class MyClass
  def my_method; 'my_method()'; end
end

class MySubClass < MyClass
end

obj = MySubClass.new
obj.my_method()      # => "my_method()"

MySubClass.ancestors # => [MySubClass, MyClass, Object, Kernel, BasicObject]
```

### Modules and Lookup

When you `include` a module in a class (or even in another module), Ruby
inserts the module in the ancestors chain, right above the including
class itself:

```ruby
module M1
  def my_method; 'M1#my_method()'; end
end

class C
  include M1
end

class D < C; end

D.ancestors # => [D, C, M1, Object, Kernel, BasicObject]
```

Starting from Ruby 2.0, you also have a second way to insert a module in a
class's chain of ancestors: the `prepend` method. It works like `include`,
but it inserts the module _below_ the including class (sometimes called the
_includer_), rather than above it.

```ruby
class C2
  prepend M2
end

class D2 < C2; end

D2.ancestors # => [D2, M2, C2, Object, Kernel, BasicObject]
```

