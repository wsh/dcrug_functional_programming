!SLIDE
# Tail Call Optimization

    @@@ruby
    def factorial(number)
      def f(accumulator, number)
        return accumulator if number == 1
        factorial(number * accumulator, number - 1)
      end

      f(1, number)
    end


