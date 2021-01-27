=begin
Write your code for the 'Tournament' exercise in this file. Make the tests in
`tournament_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/tournament` directory.
=end

class Tournament
  def self.tally(input)
    new.tally(input)
  end

  def tally(input)
    [header, detail(input)].join
  end

  private

  def header
    "Team                           | MP |  W |  D |  L |  P"
  end

  def detail(input)
    input
  end
end
