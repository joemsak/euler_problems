#!/usr/bin/ruby

fibbonaci_numbers = [1, 2]

while fibbonaci_numbers.last <= 4_000_000 do
  first_previous_term = fibbonaci_numbers.last
  second_previous_term = fibbonaci_numbers[-2]

  new_term = first_previous_term + second_previous_term

  break if new_term > 4_000_000
  fibbonaci_numbers << new_term
end

even_fib_numbers = fibbonaci_numbers.reject(&:odd?)

p even_fib_numbers.inject { |sum, x| sum + x }
