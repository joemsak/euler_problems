# 2520 is the smallest number that can be divided by each of the numbers from 1 to 10 without any remainder.

# What is the smallest positive number that is evenly divisible by all of the numbers from 1 to 20?

class Divisible
  def findSmallest(range1)
    smallest = range1.max
    flag = false
    while !flag
      range1.to_a.reverse.each do |x|
        if smallest % x != 0
          smallest += 1
          break
        end
        if x == 1 
          flag = true
        end
      end
    end
    smallest
  end
end

describe Divisible do
  it "finds the smallest positive number divisible by 1-10" do
    Divisible.new.findSmallest((1..10)).should == 2520
    end
end
temp = Divisible.new.findSmallest((1..20))
puts "The smallest possible number that is evenly divisible by 1-20 is #{temp}"