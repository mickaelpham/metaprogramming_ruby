def math(a, b)
  yield(a, b)
end

def do_math(a, b, &operation)
  math(a, b, &operation)
end

result = do_math(2, 3) { |x, y| x * y }
puts "The result: #{result}"
