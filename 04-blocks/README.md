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

### Scope Gates

There are exactly three places where a program leaves the previous scope behind
and opens a new one:

* Class definitions
* Module definitions
* Methods

Scope changes whenever the program enters (or exits) a class or module
definition or a method. These three borders are marked by the keywords `class`,
`module`, and `def`, respectively.

Callable Objects Wrap-Up
========================

Callable objects are snippets of code that you can evaluate, and they can carry
their own scope along with them. They can be the following:

* _Blocks_ (no really "objects" but still "callable"): evaluated in the scope in
  which they're defined.
* _Procs_: objects of class `Proc`. Like blocks, they are evaluated in the scope
  where they're defined.
* _Lambdas_: also objects of class `Proc` but subtly different from regular
  procs. They're closures like blocks and procs, and as such they're evalated in
  the scope where they're defined.
* _Methods_: bound to an object, they are evaluated in that object's scope. They
  can also be rebound to a different object or class.

Different callable objects exhibit subtly different behaviors. In methods and
lambdas, `return` returns from the callable object, while in procs and blocks,
`return` returns from the callable object's *original context*. Different
callable objects also react differently to calls with the wrong _arity_. Methods
are stricter, lambdas are almost as strict (save for some corner cases), and
procs and blocks are more tolerant.

You can still convert from one callable object to another, such as by using
`Proc.new`, `Method#to_proc`, or the `&` operator.
