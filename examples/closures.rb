class ClosureExample
  def initialize(value)
    @value = value
  end

  def print
    -> { puts "Current value is: #{@value}" }
  end

  def increment
    -> { @value += 1 }
  end
end

if __FILE__ == $0
  closure_example = ClosureExample.new(0)

  printer = closure_example.print
  incrementer = closure_example.increment

  3.times do
    printer.call
    incrementer.call
  end

end
