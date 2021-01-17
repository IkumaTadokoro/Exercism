=begin

Write your code for the 'Hamming' exercise in this file. Make the tests in
`hamming_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/hamming` directory.
=end

class Hamming
  def self.compute(base_strand, comparative_strand)
    raise ArgumentError if base_strand.size != comparative_strand.size

    base = base_strand.chars
    comparative = comparative_strand.chars

    base.zip(comparative).select { | x, y | x != y }.size
  end
end
