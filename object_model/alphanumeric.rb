# Old code, to be refactored
def to_alphanumeric(s)
  s.gsub(/[^\w\s]/, '')
end

# Unit test
require 'test/unit'

class ToAlphanumericTest < Test::Unit::TestCase
  def test_strip_non_alphanumeric_characters
    assert_equal '3 the Magic Number', to_alphanumeric('#3, the *Magic, Number*?')
  end
end
