require 'minitest/autorun'
require_relative 'clock'

# Common test data version: 2.4.0 b344762
class ClockTest < Minitest::Test
  def test_on_the_hour
    # skip
    assert_equal "08:00", Clock.new(h: 8).to_s
  end

  def test_past_the_hour
    # skip
    assert_equal "11:09", Clock.new(h: 11, m: 9).to_s
  end

  def test_midnight_is_zero_hours
    # skip
    assert_equal "00:00", Clock.new(h: 24).to_s
  end

  def test_hour_rolls_over
    # skip
    assert_equal "01:00", Clock.new(h: 25).to_s
  end

  def test_hour_rolls_over_continuously
    # skip
    assert_equal "04:00", Clock.new(h: 100).to_s
  end

  def test_sixty_minutes_is_next_hour
    # skip
    assert_equal "02:00", Clock.new(h: 1, m: 60).to_s
  end

  def test_minutes_roll_over
    # skip
    assert_equal "02:40", Clock.new(m: 160).to_s
  end

  def test_minutes_roll_over_continuously
    # skip
    assert_equal "04:43", Clock.new(m: 1723).to_s
  end

  def test_hour_and_minutes_roll_over
    # skip
    assert_equal "03:40", Clock.new(h: 25, m: 160).to_s
  end

  def test_hour_and_minutes_roll_over_continuously
    # skip
    assert_equal "11:01", Clock.new(h: 201, m: 3001).to_s
  end

  def test_hour_and_minutes_roll_over_to_exactly_midnight
    # skip
    assert_equal "00:00", Clock.new(h: 72, m: 8640).to_s
  end

  def test_negative_hour
    # skip
    assert_equal "23:15", Clock.new(h: -1, m: 15).to_s
  end

  def test_negative_hour_rolls_over
    # skip
    assert_equal "23:00", Clock.new(h: -25).to_s
  end

  def test_negative_hour_rolls_over_continuously
    # skip
    assert_equal "05:00", Clock.new(h: -91).to_s
  end

  def test_negative_minutes
    # skip
    assert_equal "00:20", Clock.new(h: 1, m: -40).to_s
  end

  def test_negative_minutes_roll_over
    # skip
    assert_equal "22:20", Clock.new(h: 1, m: -160).to_s
  end

  def test_negative_minutes_roll_over_continuously
    # skip
    assert_equal "16:40", Clock.new(h: 1, m: -4820).to_s
  end

  def test_negative_sixty_minutes_is_previous_hour
    # skip
    assert_equal "01:00", Clock.new(h: 2, m: -60).to_s
  end

  def test_negative_hour_and_minutes_both_roll_over
    # skip
    assert_equal "20:20", Clock.new(h: -25, m: -160).to_s
  end

  def test_negative_hour_and_minutes_both_roll_over_continuously
    # skip
    assert_equal "22:10", Clock.new(h: -121, m: -5810).to_s
  end

  def test_add_minutes
    # skip
    clock1 = Clock.new(h: 10, m: 0)
    assert_equal "10:03", (clock1 + Clock.new(m: 3)).to_s
  end

  def test_add_no_minutes
    # skip
    clock1 = Clock.new(h: 6, m: 41)
    assert_equal "06:41", (clock1 + Clock.new(m: 0)).to_s
  end

  def test_add_to_next_hour
    # skip
    clock1 = Clock.new(h: 0, m: 45)
    assert_equal "01:25", (clock1 + Clock.new(m: 40)).to_s
  end

  def test_add_more_than_one_hour
    # skip
    clock1 = Clock.new(h: 10, m: 0)
    assert_equal "11:01", (clock1 + Clock.new(m: 61)).to_s
  end

  def test_add_more_than_two_hours_with_carry
    # skip
    clock1 = Clock.new(h: 0, m: 45)
    assert_equal "03:25", (clock1 + Clock.new(m: 160)).to_s
  end

  def test_add_across_midnight
    # skip
    clock1 = Clock.new(h: 23, m: 59)
    assert_equal "00:01", (clock1 + Clock.new(m: 2)).to_s
  end

  def test_add_more_than_one_day
    # skip
    clock1 = Clock.new(h: 5, m: 32)
    assert_equal "06:32", (clock1 + Clock.new(m: 1500)).to_s
  end

  def test_add_more_than_two_days
    # skip
    clock1 = Clock.new(h: 1, m: 1)
    assert_equal "11:21", (clock1 + Clock.new(m: 3500)).to_s
  end

  def test_subtract_minutes
    # skip
    clock1 = Clock.new(h: 10, m: 3)
    assert_equal "10:00", (clock1 - Clock.new(m: 3)).to_s
  end

  def test_subtract_to_previous_hour
    # skip
    clock1 = Clock.new(h: 10, m: 3)
    assert_equal "09:33", (clock1 - Clock.new(m: 30)).to_s
  end

  def test_subtract_more_than_an_hour
    # skip
    clock1 = Clock.new(h: 10, m: 3)
    assert_equal "08:53", (clock1 - Clock.new(m: 70)).to_s
  end

  def test_subtract_across_midnight
    # skip
    clock1 = Clock.new(h: 0, m: 3)
    assert_equal "23:59", (clock1 - Clock.new(m: 4)).to_s
  end

  def test_subtract_more_than_two_hours
    # skip
    clock1 = Clock.new(h: 0, m: 0)
    assert_equal "21:20", (clock1 - Clock.new(m: 160)).to_s
  end

  def test_subtract_more_than_two_hours_with_borrow
    # skip
    clock1 = Clock.new(h: 6, m: 15)
    assert_equal "03:35", (clock1 - Clock.new(m: 160)).to_s
  end

  def test_subtract_more_than_one_day
    # skip
    clock1 = Clock.new(h: 5, m: 32)
    assert_equal "04:32", (clock1 - Clock.new(m: 1500)).to_s
  end

  def test_subtract_more_than_two_days
    # skip
    clock1 = Clock.new(h: 2, m: 20)
    assert_equal "00:20", (clock1 - Clock.new(m: 3000)).to_s
  end

  def test_clocks_with_same_time
    # skip
    clock1 = Clock.new(h: 15, m: 37)
    clock2 = Clock.new(h: 15, m: 37)
    assert clock1 == clock2
  end

  def test_clocks_a_minute_apart
    # skip
    clock1 = Clock.new(h: 15, m: 36)
    clock2 = Clock.new(h: 15, m: 37)
    refute clock1 == clock2
  end

  def test_clocks_an_hour_apart
    # skip
    clock1 = Clock.new(h: 14, m: 37)
    clock2 = Clock.new(h: 15, m: 37)
    refute clock1 == clock2
  end

  def test_clocks_with_hour_overflow
    # skip
    clock1 = Clock.new(h: 10, m: 37)
    clock2 = Clock.new(h: 34, m: 37)
    assert clock1 == clock2
  end

  def test_clocks_with_hour_overflow_by_several_days
    # skip
    clock1 = Clock.new(h: 3, m: 11)
    clock2 = Clock.new(h: 99, m: 11)
    assert clock1 == clock2
  end

  def test_clocks_with_negative_hour
    # skip
    clock1 = Clock.new(h: 22, m: 40)
    clock2 = Clock.new(h: -2, m: 40)
    assert clock1 == clock2
  end

  def test_clocks_with_negative_hour_that_wraps
    # skip
    clock1 = Clock.new(h: 17, m: 3)
    clock2 = Clock.new(h: -31, m: 3)
    assert clock1 == clock2
  end

  def test_clocks_with_negative_hour_that_wraps_multiple_times
    # skip
    clock1 = Clock.new(h: 13, m: 49)
    clock2 = Clock.new(h: -83, m: 49)
    assert clock1 == clock2
  end

  def test_clocks_with_minute_overflow
    # skip
    clock1 = Clock.new(h: 0, m: 1)
    clock2 = Clock.new(h: 0, m: 1441)
    assert clock1 == clock2
  end

  def test_clocks_with_minute_overflow_by_several_days
    # skip
    clock1 = Clock.new(h: 2, m: 2)
    clock2 = Clock.new(h: 2, m: 4322)
    assert clock1 == clock2
  end

  def test_clocks_with_negative_minute
    # skip
    clock1 = Clock.new(h: 2, m: 40)
    clock2 = Clock.new(h: 3, m: -20)
    assert clock1 == clock2
  end

  def test_clocks_with_negative_minute_that_wraps
    # skip
    clock1 = Clock.new(h: 4, m: 10)
    clock2 = Clock.new(h: 5, m: -1490)
    assert clock1 == clock2
  end

  def test_clocks_with_negative_minute_that_wraps_multiple_times
    # skip
    clock1 = Clock.new(h: 6, m: 15)
    clock2 = Clock.new(h: 6, m: -4305)
    assert clock1 == clock2
  end

  def test_clocks_with_negative_hours_and_minutes
    # skip
    clock1 = Clock.new(h: 7, m: 32)
    clock2 = Clock.new(h: -12, m: -268)
    assert clock1 == clock2
  end

  def test_clocks_with_negative_hours_and_minutes_that_wrap
    # skip
    clock1 = Clock.new(h: 18, m: 7)
    clock2 = Clock.new(h: -54, m: -11513)
    assert clock1 == clock2
  end

  def test_full_clock_and_zeroed_clock
    # skip
    clock1 = Clock.new(h: 24, m: 0)
    clock2 = Clock.new(h: 0, m: 0)
    assert clock1 == clock2
  end
end
