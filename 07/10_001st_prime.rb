#!/usr/bin/ruby
require './lib/factors'

class Fixnum
  include Factors
end

# start with 3
# because the 10,001st prime
# ain't gonna be 2
n = 3

# that's also why i
# starts at 1
i = 1

while true
  i += 1 if n.prime?
  break if i == 10_001
  # only have to check odd numbers
  n += 2
end

p n
