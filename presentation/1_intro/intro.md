!SLIDE
#Functional Programming in Ruby

Presentation by Tucker Barbour

tucker@logik.com

March 14th, 2013

@DCRUG

!SLIDE
#Functional Programming in Ruby
If you're using Ruby you're probably already using Functional Programming paradigms and you just don't realize it.

!SLIDE
# Examples
    @@@ ruby
    File.open(source, 'r') do |f|
      f.gets
    end

!SLIDE
# Examples
    @@@ ruby
    def my_method(values)
      values.each do |value|
        yield value if value > 0
      end
    end

!SLIDE
# Examples
    @@@ ruby
    def data
      @data ||= complex_computation(@source)
    end

!SLIDE
# Examples
    @@@ ruby
    values.select{ |v| v % 2 == 0 }.reduce(0, :+)

!SLIDE
# Examples
    @@@ ruby
    it "returns a Truthy value" do
      subject.truthy(value).should be_true
    end

!SLIDE
# Examples
    @@@ ruby
      def my_method(value, &fallback)
        fallback ||= ->(e) { raise }
        # do something...
      rescue => error
        fallback.call(error)
      end
