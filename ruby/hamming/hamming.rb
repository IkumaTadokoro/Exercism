=begin

Write your code for the 'Hamming' exercise in this file. Make the tests in
`hamming_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/hamming` directory.
=end

class Hamming
  def self.compute(base, comparative)
    raise ArgumentError if base.size != comparative.size

    base.chars.zip(comparative.chars).select { | x, y | x != y }.size
  end
end
