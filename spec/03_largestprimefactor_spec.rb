# The prime factors of 13195 are 5, 7, 13 and 29.
# What is the largest prime factor of the number 600851475143 ?

class Factors
  def primeFactors(num)
    i = 2
    n = num
    fact = []
    until (i > n) do
      while (n % i == 0) do
        fact << i
        n = n / i
        i += 1
      end
      i += 1
    end
    fact
  end
end


describe Factors do
	it "returns the prime factors" do
		factors = Factors.new.primeFactors(13195)
		factors.should == [5,7,13,29]
	end
	it "returns the largest prime factor" do
	   factors = Factors.new.primeFactors(13195)
     factors.max.should == 29
  end
end


t = Factors.new.primeFactors(600851475143)
p "The largest prime factor of 600851475143 is #{t.max}"

