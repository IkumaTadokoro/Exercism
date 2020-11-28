=begin
Write your code for the 'Resistor Color Duo' exercise in this file. Make the tests in
`resistor_color_duo_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/resistorcolorduo` directory.
=end

class ResistorColorDuo
  VALID_RANGE = 0..1
  COLOR_TABLE = {
    'black'  => 0,
    'brown'  => 1,
    'red'    => 2,
    'orange' => 3,
    'yellow' => 4,
    'green'  => 5,
    'blue'   => 6,
    'violet' => 7,
    'grey'   => 8,
    'white'  => 9
  }

  def self.value(bands)
    bands[VALID_RANGE].map { |band| COLOR_TABLE[band] }.join.to_i
  end
end
