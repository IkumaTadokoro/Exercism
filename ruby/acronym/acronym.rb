=begin
Write your code for the 'Acronym' exercise in this file. Make the tests in
`acronym_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/acronym` directory.
=end

class Acronym
  def self.abbreviate(long_name)
    # long_name.split(/\W/).map(&:chr).join.upcase
    long_name.scan(/\b\w/).join.upcase
  end
end
