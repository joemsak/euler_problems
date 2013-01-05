
#Each new term in the Fibonacci sequence is generated by adding the previous two terms. By starting with 1 and 2,
# the first 10 terms will be:
#
#1, 2, 3, 5, 8, 13, 21, 34, 55, 89, ...
#By considering the terms in the Fibonacci sequence whose values do not exceed four million, 
#find the sum of the even-valued terms.

class FibonacciSequence
  attr_accessor :terms, :iterations

  def initialize(num = 0)
    @terms      = [1, 2] 
    @iterations = num - 2 # the first 2 iterations are already completed
  end

  def next_term
    prev_last_term           = terms.last
    prev_second_to_last_term = terms[-2]

    prev_last_term + prev_second_to_last_term
  end

  def run!
    iterations.times do |i|
      terms << next_term
    end
  end

  def even_terms
    terms.reject do |t|
      t % 2 != 0
    end
  end

  def sum_even_terms
    even_terms.inject(&:+)
  end

end

describe FibonacciSequence do
  it "has the first two terms" do
    fib = FibonacciSequence.new
    fib.terms.should == [1, 2]
  end

  it "adds the previous 2 terms" do
    fib = FibonacciSequence.new
    fib.next_term.should == 3
  end

  it "sequences the terms" do
    fib = FibonacciSequence.new(3)
    fib.run!
    fib.terms.should == [1, 2, 3]
  end

  it "returns the even numbered fibs" do
    fib = FibonacciSequence.new(10)
    fib.run!
    fib.even_terms.should == [2, 8, 34]
  end

  it "returns the sum of the even terms" do
    fib = FibonacciSequence.new(10)
    fib.run!
    fib.sum_even_terms.should == 44 
  end

end


p "The Sum of the even fib numbers no greater than 4 million"
fib = FibonacciSequence.new(4_000_000)
fib.run!
p fib.sum_even_terms