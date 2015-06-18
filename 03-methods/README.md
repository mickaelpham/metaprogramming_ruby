Quiz: Bug Hunt
==============

_Where you discover that bugs in a `method_missing` can be difficult and a pain
in the ass to squash._

```ruby
class Roulette
  def method_missing(name, *args)
    person = name.to_s.capitalize

    3.times do
      number = rand(10) + 1
      puts "#{number}..."
    end

    "#{person} got a #{number}"
  end
end
```

Note that the variable `number` is defined within a block (the block that gets
passed to `times`) and falls out of scope by the last line of `method_missing`.

When Ruby executes that line, it can't know that the `number` there is supposed
to be a variable. As a default, it assumes that `number` must be a parenthese-
less method call on `self`.

In normal circumstances, you would get an explicit `NoMethodError` that makes
the problem obvious. But in this case you have a `method_missing` and that's
where the call to `number` ends. The same chain of events happens again–and
again and again–until the call stack overflows.

Pretty nasty...
