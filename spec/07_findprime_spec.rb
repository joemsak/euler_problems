#By listing the first six prime numbers: 2, 3, 5, 7, 11, and 13, we can see that the 6th prime is 13.
#What is the 10 001st prime number?

class FindPrime
	def generatePrimes(num)
		primes = Array.new
		primes << 2 << 3
		range1 = (5..150000).to_a.delete_if {|x| x % 2 == 0} 
		#preset range with evens thrown out. prob. needs changing to remove arbitrary limit
   			range1.each do |i|
   				if prime?(i)
   					primes << i
   				end
   				break if primes.length >= num
   			end
		primes
	end
	
	def findNthPrime(num)
		generatePrimes(num)[num-1]
	end

	def prime?(num)
		foundDivisor = false
   			for i in 2..(Math.sqrt(num))
				foundDivisor = ((num % i) == 0) || foundDivisor
			end
  		not foundDivisor
	end

end

describe FindPrime do
	it "finds the 6th prime number" do
		FindPrime.new.findNthPrime(6).should == 13
		FindPrime.new.findNthPrime(7).should == 17
	end
	it "determines if a number is prime" do
		FindPrime.new.prime?(7).should == true
		FindPrime.new.prime?(6).should == false
	end
end

temp = FindPrime.new.findNthPrime(10001)
puts "The 10,001st prime is #{temp}"