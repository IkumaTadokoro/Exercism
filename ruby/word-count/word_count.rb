=begin
Write your code for the 'Word Count' exercise in this file. Make the tests in
`word_count_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/word-count` directory.
=end

class Phrase
  def initialize(phrase)
    @phrase = phrase.downcase.scan(/\w+[\w']*\w+/)
  end

  def word_count
    @phrase.to_h { |word| [word, @phrase.select { |comparative_word| word.casecmp?(comparative_word) }.size ] }
  end
end
