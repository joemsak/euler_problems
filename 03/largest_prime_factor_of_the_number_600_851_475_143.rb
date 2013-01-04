#!/usr/bin/ruby
require './lib/factors'

class Fixnum
  include Factors
end

factors = 600_851_475_143.factors
prime_factors = factors.keep_if(&:prime?)

p largest_prime_factor = prime_factors.max
