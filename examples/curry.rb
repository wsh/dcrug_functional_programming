def sum_of_ints(a, b)
  (a..b).reduce(0, :+)
end

def sum_of_squares(a, b)
  (a..b).map{ |n| n**2 }.reduce(0, :+)
end

def sum_of_powers_of_2(a, b)
  (a..b).map{ |n| 2**n }.reduce(0, :+)
end

def sum(f, a, b)
  (a..b).map(&f).reduce(0, :+)
end

puts "Standard Methods"
puts sum_of_ints(1, 9)
puts sum_of_squares(1, 9)
puts sum_of_powers_of_2(1, 9)

sum = ->(f, a, b){ (a..b).map(&f).reduce(0, :+) }
identity = ->(x){ x }
squares = ->(x){ x**2 }
powers_of_2 = ->(x){ 2**x }

curried_sum_of_ints = sum.curry[identity]
curried_sum_of_squares = sum.curry[squares]
curried_sum_of_powers_of_2 = sum.curry[powers_of_2]

puts "\nCurried Functions"
puts curried_sum_of_ints.call(1, 9)
puts curried_sum_of_squares.call(1, 9)
puts curried_sum_of_powers_of_2.call(1, 9)

map_reduce = ->(m, r, enum){ enum.map(&m).reduce(&r) }

times_10 = ->(i, x){ x * 10 }
ints_times_10  = map_reduce.curry[identity, times_10]

def sum_of(f, a, b)
  (a..b).map(&f).reduce(0, :+)
end

puts sum_of squares, 1, 9
puts ints_times_10.call((1..9))
