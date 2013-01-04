#!/usr/bin/ruby

squares = (1..100).map { |n| n**2 }
sum     = (1..100).inject(&:+)

sum_of_squares = squares.inject(&:+)
square_of_sum  = sum**2

p difference = (square_of_sum - sum_of_squares)
