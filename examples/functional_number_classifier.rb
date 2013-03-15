class FunctionalNumberClassifier
  def factor?(number, potential_factor)
    number % potential_factor == 0
  end

  def factors(number)
    (1..number + 1).select{ |potential_factor| factor?(number, potential_factor) }
  end

  def sum(factors)
    factors.reduce(0, :+)
  end

  def perfect?(number)
    sum(factors(number)) - number == number
  end

  def abundant?(number)
    sum(factors(number)) - number > number
  end

  def deficient?(number)
    sum(factors(number)) - number < number
  end
end
