# Each new term in the Fibonacci sequence is generated
# by adding the previous two terms.
#
# By starting with 1 and 2, the first 10 terms will be:
# 1, 2, 3, 5, 8, 13, 21, 34, 55, 89, ...
#
# By considering the terms in the Fibonacci sequence
# whose values do not exceed four million,
# find the sum of the even-valued terms.

class FibonacciSequence
  def initialize(num = 0)
    @terms       = [1, 2]
    @upper_limit = num
  end

  def sum_even_terms
    even_terms.inject(&:+)
  end

  def terms
    while next_term <= upper_limit do
      @terms << next_term
    end

    @terms
  end

  private
  attr_reader :upper_limit

  def next_term
    @terms[-1] + @terms[-2]
  end

  def even_terms
    @even_terms ||= terms.reject do |t|
      t % 2 != 0
    end
  end
end

describe FibonacciSequence do
  it "starts with the first two terms" do
    fib = FibonacciSequence.new
    fib.terms.should == [1, 2]
  end

  it "sequences up to the upper limit" do
    fib = FibonacciSequence.new(3)
    fib.terms.should == [1, 2, 3]
  end

  it "returns the sum of the even terms" do
    fib = FibonacciSequence.new(89)
    fib.sum_even_terms.should == 44
  end
end

fib = FibonacciSequence.new(4_000_000)

p "The Sum of the even fib numbers no greater than 4 million:"
p fib.sum_even_terms
