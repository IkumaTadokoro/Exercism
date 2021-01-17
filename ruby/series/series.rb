=begin
Write your code for the 'Series' exercise in this file. Make the tests in
`series_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/series` directory.
=end

class Series
  def initialize(digits)
    @digits = digits
  end

  def slices(number_of_digits)
    raise ArgumentError if number_of_digits > @digits.length

    @digits.chars.each_cons(number_of_digits).map(&:join)
  end
end
