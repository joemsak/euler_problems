#The sum of the squares of the first ten natural numbers is,
#1^2 + 2^2 + ... + 10^2 = 385
#
#The square of the sum of the first ten natural numbers is,
#(1 + 2 + ... + 10)^2 = 55^2 = 3025
#
#Hence the difference between the sum of the squares of the first ten natural numbers and the square of the sum is 3025 − 385 = 2640.
#
#Find the difference between the sum of the squares of the first one hundred natural numbers and the square of the sum.

class SumSquares
	def sumOfSquares(range1)
		sum = 0
		range1.each do |x|
			sum += x ** 2 
		end
		sum
	end

	def squareOfSum(range1)
		sum = 0
		range1.each do |x|
			sum += x
		end
		sum = sum ** 2
	end
	def findDifference(range1)
		squareOfSum(range1) - sumOfSquares(range1)
	end



end

describe SumSquares do
	it "gives the sum of the squares of the first ten natural numbers" do
		SumSquares.new.sumOfSquares(1..10).should == 385
	end
	it "gives the square of the sum of the first ten natural numbers" do
		SumSquares.new.squareOfSum(1..10).should == 3025
	end
	it "gives the difference between the the square of sum and sum of squares" do
		SumSquares.new.findDifference(1..10).should == 2640
	end
end

temp = SumSquares.new.findDifference(1..100)
puts "The difference between the square of the sum and the sum of square of the first 100 numbers is #{temp}"
