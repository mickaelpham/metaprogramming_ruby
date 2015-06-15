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
