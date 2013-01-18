# 2520 is the smallest number that can be divided by each of the numbers from 1 to 10 without any remainder.

# What is the smallest positive number that is evenly divisible by all of the numbers from 1 to 20?
require 'prime'
class Divisible
#  def findSmallest(range1)
#   smallest = range1.max
#    flag = false
#    while !flag
#      range1.to_a.reverse.each do |x|
#        if smallest % x != 0
#          smallest += 1
#          break
#        end
#        if x == 1 
#          flag = true
#        end
#      end
#    end
#    smallest
#  end

  
  def listFactors(range1) 
    factors = Hash.new
    range1.each do |x|
      term = x.prime_division
      if term != []
        if factors[term[0][0]] == nil || term[0][1] > factors[term[0][0]] 
           factors[term[0][0]] = term[0][1]
        end
      end
    end
    factors
  end

  def calculateFromFactors(factors)
    expanded = Array.new
    factors.each do |key, value| 
      expanded << key ** value
    end
    expanded.inject(:*)
  end

  def findSmallest(range1)
    calculateFromFactors(listFactors(range1))
  end


end


describe Divisible do
  it "multiplies all the values in an array" do
    Divisible.new.calculateFromFactors({2 => 1, 3 => 1, 5 => 1}).should == 30
  end
  it "finds the smallest positive number divisible by 1-10" do
    Divisible.new.findSmallest((1..10)).should == 2520
  end
  it "gives a hash with the amount of factors" do 
    Divisible.new.listFactors(1..3).should == {2 => 1, 3 => 1}
  end
end

temp = Divisible.new.findSmallest((1..20))
puts "The smallest possible number that is evenly divisible by 1-20 is #{temp}"
