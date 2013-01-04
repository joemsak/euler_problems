#!/usr/bin/ruby

def all_evenly_divisible?(m)
  (2..20).all? { |n| m % n == 0 }
end

multiple = 2540

until all_evenly_divisible?(multiple)
  multiple += 20
end

p multiple
