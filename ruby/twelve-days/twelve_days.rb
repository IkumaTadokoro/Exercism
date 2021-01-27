=begin
Write your code for the 'Twelve Days' exercise in this file. Make the tests in
`twelve_days_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/twelve-days` directory.
=end

class TwelveDays
  GIFTS = [
    ['first', 'a Partridge in a Pear Tree'],
    ['second', 'two Turtle Doves'],
    ['third', 'three French Hens'],
    ['fourth', 'four Calling Birds'],
    ['fifth', 'five Gold Rings'],
    ['sixth', 'six Geese-a-Laying'],
    ['seventh', 'seven Swans-a-Swimming'],
    ['eighth', 'eight Maids-a-Milking'],
    ['ninth', 'nine Ladies Dancing'],
    ['tenth', 'ten Lords-a-Leaping'],
    ['eleventh', 'eleven Pipers Piping'],
    ['twelfth', 'twelve Drummers Drumming']
  ]

  def self.song
    new.song
  end

  def song
    GIFTS.size.times.map{ |n| verse(n) }.join("\n")
  end

  private

  def verse(n)
    "On the #{day(n)} day of Christmas my true love gave to me: #{build_lyrics(gifts(n))}.\n"
  end

  def day(n)
    GIFTS[n].first
  end

  def gifts(n)
    GIFTS.take(n + 1).map(&:last)
  end

  def build_lyrics(gifts)
    return gifts.first if gifts.one?

    first_gift, *after_second_gifts = gifts
    "#{after_second_gifts.reverse.join(', ')}, and #{first_gift}"
  end

end
