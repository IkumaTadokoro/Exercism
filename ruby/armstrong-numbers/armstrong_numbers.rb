=begin
Write your code for the 'Armstrong Numbers' exercise in this file. Make the tests in
`armstrong_numbers_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/armstrong-numbers` directory.
=end

class ArmstrongNumbers
  def self.include?(number)
    number == number.to_s.chars.map { |num| num.to_i ** number.to_s.length }.sum
  end
end
