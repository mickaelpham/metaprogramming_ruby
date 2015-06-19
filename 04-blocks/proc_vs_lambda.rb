require 'pp'

# In a lambda, `return` just returns from the lambda:
def double(callable_object)
  callable_object.call * 2
end

l = -> { return 10 }
pp double(l) # => 20

# In a proc, `return` behaves differently. Rather than return from the proc, it
# returns from the scope where the proc itself was defined:
def another_double
  p = Proc.new { return 10 }
  result = p.call
  return result * 2 # unreachable code!
end

pp another_double # => 10

# If you're aware of this behavior, you can steer clear of buggy code like this:
begin
  p = Proc.new { return 10 }
  pp double(p) # => LocalJumpError!
rescue LocalJumpError
  puts <<-ERROR
    04-blocks/proc_vs_lambda.rb:20:in `block in <main>': unexpected return
    (LocalJumpError)
  ERROR
end

# The previous program tries to return from the scope where `p` is defined.
# Because you can't return from the top-level scope, the program fails. You can
# avoid this kind of mistake if you avoid using explicit `returns`:
p = Proc.new { 10 }
pp double(p)

# Last but not least, the second difference between procs and lambdas concerns
# the way they check their arguments. If a proc has an _arity_ of two, meaning
# that it accepts two arguments:
p = Proc.new { |a, b| [a, b] }
pp p.arity # => 2

# If you call with too many arguments (e.g. 3) a proc drops the excess
# arguments. If there are too few arguments, it assigns `nil` to the missing
# arguments.
pp p.call(1, 2, 3) # => [1, 2]
pp p.call(1)       # => [1, nil]

# Lambdas on the other hand will complain with `ArgumentError`
l = ->(a, b) { [a, b] }
l.call(1, 2, 3) # => ArgumentError!
