#!/usr/bin/ruby
class Fixnum
  def prime?
    factors == [self, 1]
  end

  def factors
    return [1] if self == 1
    i = 2
    factor = (i..self).find { |n| self % n == 0 }
    [factor] + (self / factor).factors
  end
end

factors = 600_851_475_143.factors
prime_factors = factors.keep_if(&:prime?)

p largest_prime_factor = prime_factors.max
