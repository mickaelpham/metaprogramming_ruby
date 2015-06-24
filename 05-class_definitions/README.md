Class Definitions
=================

* The Ruby interpreter always keep a reference to the _current class_ (or
  module). All methods defined with `def` become instance methods of the current
  class.

* In a class definition, the current object `self` and the current class are the
  same—the class being defined.

* If you have a reference to the class, you can open the class with `class_eval`
  (or `module_eval`).

Singleton Classes
=================

When you ask an object for its class, Ruby doesn't always tell you the whole
truth. Instead of the class that you see, an object can hat its own special,
hidden class. That's called the _singleton class_ of the object.
