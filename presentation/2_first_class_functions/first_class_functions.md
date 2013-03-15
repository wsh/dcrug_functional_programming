!SLIDE
# First Class Functions

  The ability to pass functions as arguments to other functions

!SLIDE bullet
# First Class Functions

  * Lambda
  * Proc
  * Method
  * (Block)

!SLIDE
# Examples
    @@@ ruby
      File.open(source, 'r') do |f|
        f.gets
      end

!SLIDE
# Lambda

    @@@ ruby
    lamb = lambda do |name|
      puts "Hello #{name}!"
    end

    lamb = ->(name) { puts "Hello #{name}!" }

!SLIDE
# Proc
    @@@ ruby
    p = proc do |name|
      puts "Hello #{name}!"
    end

    p = Proc.new do |name|
      puts "Hello #{name}!"
    end

!SLIDE
# Method
    @@@ ruby
    EM.run do
      EM.add_periodic_timer(5, &Ticker.method(:tick))
    end



