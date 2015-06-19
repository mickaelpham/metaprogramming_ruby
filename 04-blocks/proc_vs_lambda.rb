# In a lambda, `return` just returns from the lambda:
def double(callable_object)
  callable_object.call * 2
end

l = -> { return 10 }
puts double(l) # => 20

# In a proc, `return` behaves differently. Rather than return from the proc, it
# returns from the scope where the proc itself was defined:
def another_double
  p = Proc.new { return 10 }
  result = p.call
  return result * 2 # unreachable code!
end

puts another_double # => 10

# If you're aware of this behavior, you can steer clear of buggy code like this:
begin
  p = Proc.new { return 10 }
  puts double(p) # => LocalJumpError!
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
puts double(p)
