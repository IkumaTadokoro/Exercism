=begin
Write your code for the 'High Scores' exercise in this file. Make the tests in
`high_scores_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/high-scores` directory.
=end

class HighScores
  attr_reader :scores

  def initialize(scores)
    @scores = scores
  end

  def latest
    scores.select(&:positive?).min
  end

  def personal_best
    scores.max
  end

  def personal_top_three
    scores.sort_by(&:to_i).last(3).reverse
  end

end
