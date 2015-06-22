class Loan
  def initialize(book)
    @book = book
    @time = Loan.time_class.now
  end

  def self.time_class
    @time_class || Time
  end

  def to_s
    "#{@book.upcase} loaned on #{@time}"
  end
end

# Now we can implement our FakeTime in our unit tests, a bit like Timecop
class FakeTime
  def self.now
    'Mon Apr 06 12:15:50'
  end
end

require 'test/unit'

class TestLoan < Test::Unit::TestCase
  def test_conversion_to_string
    Loan.instance_eval { @time_class = FakeTime }
    loan = Loan.new('War and Peace')
    assert_equal 'WAR AND PEACE loaned on Mon Apr 06 12:15:50', loan.to_s
  end
end

# Note that we used `instance_eval` here, but we could also have used
# `class_eval` to modify the class instance variable. However, we used
# `instance_eval` because we do not care if the object we are opening is a
# class, we just want to switch the time value.
