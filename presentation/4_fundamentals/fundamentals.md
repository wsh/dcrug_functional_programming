!SLIDE
#Fundamentals of Functional Programming

* Avoid Mutable Data (Side-effects)
* Referential Transparency
* Few Data Structures, Lots of Operations

!SLIDE bullet
#Avoid Mutable Data

* Cleaner Code
* Easier Debugging

!SLIDE
    @@@ ruby

    # Mutating Data
    def add_value(value)
      @data << (value > 0 ? value : 0)
    end

    # Avoid Mutation
    def add_value(value)
      @data + [ value > 0 ? value : 0 ]
    end

!SLIDE
    @@@ruby

    # Mutating Data
    name = "#{last_name}, #{first}"
    name = "#{title} #{name}" if title

    # Avoid Mutation
    full_name = last_and_first(first, last)
    with_title = name_with_title(full_name)

!SLIDE
    @@@ruby

    # Mutating Data
    def add_attribute(key, value)
      @attributes[key] = value
    end

    # Avoid Mutation
    attributes = { key: value }
    attributes.merge({ another_key: value })

!SLIDE
# Referential Transparency
The ability to replace an expression with it's value without changing the behavior of the program

!SLIDE bullet
# Referential Transparency
* Memoization
* Idempotence
* Parallelization and Concurrency

!SLIDE
# Memoization

    @@@ ruby
    def data
      @data ||= complex_computation(@source)
    end

!SLIDE
# Idempotence

"Insanity: Doing the same thing over and over again and expecting different results"

--Albert Einstein

!SLIDE bullet
# Idempotent
* Math
* Reading and Writing from a Database
* HTTP

!SLIDE bullet
# NOT Idempotent
* Sending an email
* Submitting an order

!SLIDE
# Parallelization and Concurrency

    @@@ ruby
      data.map { |k,v| [ k, complex_computation(v) ] }.
        group_by { |k, v| k }.
        reduce { |k, v| another_computation(v) }

!SLIDE
# Few Data Structures, Lots of Operations

## Module:Enumerable

!SLIDE
# Few Data Structures, Lots of Operations

    @@@ ruby
    class MyDataStructure
      include Enumerable

      def each(&block)
        ...
      end
    end
