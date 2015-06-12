# Monkeypatch! Don't do this at home! :evil:
class Array
  def replace(original, replacement)
    self.map { |e| e == original ? replacement : e }
  end
end

require 'test/unit'

class ReplaceTest < Test::Unit::TestCase
  def test_replace
    original = %w{ one two one three }
    replaced = original.replace 'one', 'zero'
    assert_equal %w{ zero two zero three }, replaced
  end
end
