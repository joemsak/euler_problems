#!/usr/bin/ruby

# SURE We could just check (1..20)
# But we want this shit to go faster
#
# So:
#
# all numbers are evenly divisible by 1
# leave it out
#
# if it's evenly divisible by 20
# then it is " " by 2, 4, 5, 10, & 15
#
# if it is evenly divisible by 18
# then it is " " by 3, 6, & 9
#
# if it is evenly divisible by 16
# then it is " " by 8
#
# if it is evenly divisible by 14
# then it is " " by 7
#
# finally, leave the prime numbers in

factors = [11, 12, 13, 14, 16, 17, 18, 19, 20]

multiple = 20

until factors.all? { |n| multiple % n == 0 }
  multiple += 20
end

p multiple
