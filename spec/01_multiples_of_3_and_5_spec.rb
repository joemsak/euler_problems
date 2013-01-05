# If we list all the natural numbers below 10 that are multiples of 3 or 5,
# we get 3, 5, 6 and 9.
# The sum of these multiples is 23.
#
# Find the sum of all the multiples of 3 or 5 below 1000.
#
class SumFinder
  attr_accessor :upper_bound

  def initialize(num)
    @upper_bound = num
  end

  def multiples
    result = []

    (1...upper_bound).each do |n|
      if n % 5 == 0 || n % 3 == 0
        result << n
      end
    end

    result
  end

  def sum_of_multiples
    # this is a std way of summing an array
    multiples.inject(&:+)
  end
end

describe SumFinder do
  it "finds the multiples of 3 & 5 below a number" do
    finder = SumFinder.new(15)
    finder.multiples.should == [3, 5, 6, 9, 10, 12]
  end

  it "sums the multiples" do
    finder = SumFinder.new(10)
    finder.sum_of_multiples.should == 23
  end
end

finder = SumFinder.new(1_000)
p "The sum of the 3 & 5 multiples up to 1,000 are:"
p finder.sum_of_multiples
