require './lib/factors'
class Fixnum
  include Factors
end

# The sum of the primes below 10 is 2 + 3 + 5 + 7 = 17.
#
# Find the sum of all the primes below two million.

class PrimeSummation
  attr_accessor :limit

  def initialize(limit = 3)
    @limit = limit
  end

  def sum
    primes.inject(:+)
  end

  def primes
    @primes ||= [2]

    i = 3
    while i < limit
      @primes << i if i.prime?
      i += 2
    end

    @primes
  end
end

describe PrimeSummation do
  it "returns the primes below the limit" do
    p = PrimeSummation.new(10)
    p.primes.should == [2, 3, 5, 7]
  end

  it "returns the sum of the primes" do
    p = PrimeSummation.new(10)
    p.sum.should == 17
  end
end

p = PrimeSummation.new(2_000_000)
p "The sum of the primes below 2_000_000 is #{p.sum}"
