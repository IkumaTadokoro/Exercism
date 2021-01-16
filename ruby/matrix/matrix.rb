=begin
Write your code for the 'Matrix' exercise in this file. Make the tests in
`matrix_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/matrix` directory.
=end

class Matrix
  def initialize(numbers)
    @numbers = numbers
  end

  def rows
    @numbers.split(/\R/).map { |row| row.split.map(&:to_i) }
  end

  def columns
    rows.transpose
  end
end
