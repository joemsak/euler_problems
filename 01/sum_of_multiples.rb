#!/usr/bin/ruby

i = 0
multiples = []

while i < 1000 do
  if i % 3 == 0 || i % 5 == 0
    multiples << i
  end
  i += 1
end

total = multiples.inject { |sum, x| sum + x }

p total
