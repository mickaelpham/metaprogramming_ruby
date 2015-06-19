Global Variables and Top-Level Instance Variables
=================================================

Global variables can be accessed by any scope:

```ruby
def a_scope
  $var = "some value"
end

def another_scope
  $var
end

a_scope
another_scope # => "some value"
```

The problem with global variables is that every part of the system can change
them, so in no time you'll find it difficult to track who is changing what. For
this reason, the general rule is this: when it comes to global variables, use
them sparingly, if ever.

Top-Level Instance Variable can sometimes be used in place of a global variable:

```ruby
@var = "The top-level @var"

def my_method
  @var
end

my_method # => "The top-level @var"
```

You can access a top-level instance variable whenever `main` takes the role of
`self`, as in the previous example. When any other object is `self`, the
top-level instance variable is out of scope.
