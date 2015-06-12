class Array
  def substitute(original, replacement)
    self.map { |e| e == original ? replacement : e }
  end
end

require 'test/unit'

class ReplaceTest < Test::Unit::TestCase
  def test_replace
    original = %w{ one two one three }
    replaced = original.substitute 'one', 'zero'
    assert_equal %w{ zero two zero three }, replaced
  end
end
