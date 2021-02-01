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
    [header, detail(input)].join("\n") + "\n"
  end

  private

  def header
    "Team                           | MP |  W |  D |  L |  P"
  end

  def detail(input)
    return input.chomp if input == "\n"

    detail = result_by_team(input).map do |team, scores|
      [
        [
          team.ljust(30),
          scores.size.to_s.rjust(3),
          scores.map { |score| score.count('win') }.sum.to_s.rjust(3),
          scores.map { |score| score.count('draw') }.sum.to_s.rjust(3),
          scores.map { |score| score.count('loss') }.sum.to_s.rjust(3),
          (scores.map { |score| score.count('win') }.sum * 3 + scores.map { |score| score.count('draw') }.sum).to_s.rjust(3)
        ].join(" |"),
        scores.map { |score| score.count('win') }.sum * 3 + scores.map { |score| score.count('draw') }.sum
      ]
    end.sort_by { |team, point| [-point, team] }.map(&:shift).join("\n")
  end

  def result_by_team(input)
    all_match(input).group_by(&:first)
  end

  def all_match(input)
    input.lines(chomp: true)
         .map { |line| line.split(";") }
         .flat_map { |match| match_result(match) }
  end

  def match_result(match)
    result = []
    team, opponent, score = match

    if score == 'win'
      opponent_score = 'loss'
    elsif score == 'loss'
      opponent_score = 'win'
    else
      opponent_score = score
    end

    result << [team, score]
    result << [opponent, opponent_score]
    result
  end
end



# NOTE:「;」で区切るには、String#splitを使用する。
# 'Allegoric Alaskans;Blithering Badgers;win'.split(';')
#
# [String\#lines \(Ruby 3\.0\.0 リファレンスマニュアル\)](https://docs.ruby-lang.org/ja/latest/method/String/i/lines.html)
# 文字列の各行ごとに配列の要素にするにはString#linesを使用する
# 改行文字を含めたくない場合は、chomp: trueを指定する
# ```
# >> input.lines.map { |line| line.split(";") }
# => [["Allegoric Alaskans", "Blithering Badgers", "win\n"], ["Allegoric Alaskans", "Blithering Badgers", "win\n"]]
# ```

# 集計にはEnumerable#group_byが使えそう``
#
# input = <<~INPUT
#     Allegoric Alaskans;Blithering Badgers;win
#     Devastating Donkeys;Courageous Californians;draw
#     Devastating Donkeys;Allegoric Alaskans;win
#     Courageous Californians;Blithering Badgers;loss
#     Blithering Badgers;Devastating Donkeys;loss
#     Allegoric Alaskans;Courageous Californians;win
# INPUT
#
# puts Tournament.tally(input)

input = <<~INPUT
    Allegoric Alaskans;Blithering Badgers;win
INPUT

puts Tournament.tally(input)
