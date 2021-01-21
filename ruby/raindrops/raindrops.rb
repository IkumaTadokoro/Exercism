=begin
Write your code for the 'Raindrops' exercise in this file. Make the tests in
`raindrops_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/raindrops` directory.
=end
require 'prime'

class Raindrops
  RAIN_DROPS = { 3 => 'Pling', 5 => 'Plang', 7 => 'Plong' }

  def self.convert(number)
    result = number.prime_division.map(&:first).map(&RAIN_DROPS)
    result.compact.empty? ? number.to_s : result.join
  end
end
