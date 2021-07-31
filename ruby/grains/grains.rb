=begin
Write your code for the 'Grains' exercise in this file. Make the tests in
`grains_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/grains` directory.
=end

class Grains
  FIRST_TERM = 1
  COMMON_RATIO = 2
  START_OF_SQUARE = 1
  END_OF_SQUARE = 64

  def self.square(length)
    raise ArgumentError unless (START_OF_SQUARE..END_OF_SQUARE).include?(length)
    geometric_progression(length)[length - 1]
  end

  def self.total
    geometric_progression(END_OF_SQUARE).sum
  end

  def self.geometric_progression(length)
    Array.new(length) { |index| FIRST_TERM * COMMON_RATIO ** index }
  end
end
