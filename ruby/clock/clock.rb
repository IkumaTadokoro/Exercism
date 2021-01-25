=begin
Write your code for the 'Clock' exercise in this file. Make the tests in
`clock_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/clock` directory.
=end

class Clock

  attr_reader :minutes

  def initialize(h: 0, m: 0)
    @minutes = (h * 60 + m) % (24 * 60)
  end

  def to_s
    "%02d:%02d" % [minutes / 60, minutes % 60]
  end

  def +(clock)
    self.class.new(m: minutes + clock.minutes)
  end

  def -(clock)
    self.class.new(m: minutes - clock.minutes)
  end

  def ==(clock)
    minutes == clock.minutes
  end
end
