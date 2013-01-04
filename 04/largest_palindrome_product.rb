#!/usr/bin/ruby

class Fixnum
  def palindromic?
    "#{self}" == "#{self}".reverse
  end
end

factors  = (900..999)
products = []

factors.each do |n|
  products += factors.map { |f| f * n }
end

products.keep_if(&:palindromic?)

p largest_palindromic_product = products.max
