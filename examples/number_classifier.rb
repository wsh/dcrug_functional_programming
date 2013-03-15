class InvalidNumberException < StandardError
end

class NumberClassifier

  attr_reader :factors

  def initialize(number)
    raise InvalidNumberException, "Number must be greater than 1" if number < 1

    @factors = [1, number]
    @number = number
  end

  def perfect?
    sum_of_factors - number == number
  end

  def abundant?
    sum_of_factors - number > number
  end

  def deficient?
    sum_of_factors - number < number
  end

  private

  attr_reader :number

  def factor?(factor)
    number % factor == 0
  end

  def add_factor(factor)
    @factors << factor
    @factors << number / factor
  end

  def calculate_factors
    (1..Math.sqrt(number) + 1).each do |num|
      add_factor(num) if factor?(num)
    end
  end

  def sum_of_factors
    calculate_factors

    sum = 0
    factors.each do |factor|
      sum += factor
    end
    sum
  end
end
