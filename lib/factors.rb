module Factors
  def prime?
    (2..self - 1).each do |y|
      return false if self % y == 0
    end

    true
  end

  def factors
    return [1] if self == 1
    factor = (2..self).find { |n| self % n == 0 }
    [factor] + (self / factor).factors
  end
end
