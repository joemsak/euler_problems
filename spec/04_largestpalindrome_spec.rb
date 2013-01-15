#A palindromic number reads the same both ways. The largest palindrome made from the product of two 2-digit numbers 
#is 9009 = 91 × 99.

#Find the largest palindrome made from the product of two 3-digit numbers.


class Palindrome
	def isPalindrome(num)
    num.to_s.reverse == num.to_s
  end

  def findLargest(range1)
    range2 = range1.dup
    largest = 0
    range1.each do |x|
      range1.each do |y|
        z = x * y
        if isPalindrome(z) && z > largest
          largest = z
        end
      end
    end       
    largest  
  end
end

describe Palindrome do 
	it "detects if a number is palindromic" do
		Palindrome.new.isPalindrome(9009).should == true
	end
  it "iterates through the range of three digit numbers and finds the largest palindromic product" do
    Palindrome.new.findLargest((10..99)).should == 9009 
	end
end


puts "The largest palindrome made from the product of two 3 digit numbers is: "
puts Palindrome.new.findLargest((100..999))