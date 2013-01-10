# A Pythagorean triplet is a set of three natural numbers, a < b < c, for which,
#
# a^2 + b^2 = c^2
#
# For example, 3^2 + 4^2 = 9 + 16 = 25 = 5^2.
#
# There exists exactly one Pythagorean triplet
# for which a + b + c = 1000.
# Find the product abc.

class PythagTriplet
  attr_reader :sum

  def initialize(sum = 0)
    @sum = sum
  end

  def product
    sides && sides.values.inject(:*)
  end

  private
  def sides
    catch :found do
      (0...(sum / 3)).each do |a|
        # a < 1/3 sum
        h[:a] = a

        ((a + 1)...(sum / 2)).each do |b|
          # b < 1/2 sum
          h[:b] = b

          # The problem states:
          # a + b + c = sum
          #
          # so:
          # b + c = sum - a
          #
          # c = sum - b - a
          #             not a - b
          #             because b > a
          h[:c] = sum - b - a

          throw :found, h if triplets_found?
        end
      end
    end
  end

  def triplets_found?
    h[:a]**2 + h[:b]**2 == h[:c]**2
  end

  def h
    @hash ||= {}
  end
end

describe PythagTriplet do
  let(:py) { PythagTriplet.new(24) }

  it "takes the sum of the sides" do
    py.sum.should == 24
  end

  it "calculates the sides" do
    py.send(:sides)[:c].should == 10
    py.send(:sides)[:b].should == 8
    py.send(:sides)[:a].should == 6
  end

  it "returns the product of the sides" do
    py.product.should == 480
  end
end

py = PythagTriplet.new(1000)
p "The product of the pythagorean triplets of 1,000:"
p py.product
