=begin
Write your code for the 'Difference Of Squares' exercise in this file. Make the tests in
`difference_of_squares_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/difference-of-squares` directory.
=end

class Squares
  attr_reader :numbers

  def initialize(range)
    @numbers = [*1..range]
  end

  def difference
    square_of_sum - sum_of_squares
  end

  def square_of_sum
    numbers.sum ** 2
  end

  def sum_of_squares
    numbers.map { |number| number ** 2 }.sum
  end

end
