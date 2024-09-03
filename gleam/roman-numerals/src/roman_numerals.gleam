import gleam/io
import gleam/string as s

pub fn main() {
  convert(200) |> io.print
}

pub fn convert(number: Int) -> String {
  "I"
  |> s.repeat(number)
  |> s.replace("IIIII", "V")
  |> s.replace("IIII", "IV")
  |> s.replace("VV", "X")
  |> s.replace("VIV", "IX")
  |> s.replace("XXXXX", "L")
  |> s.replace("XXXX", "XL")
  |> s.replace("LL", "C")
  |> s.replace("LXL", "XC")
  |> s.replace("CCCCC", "D")
  |> s.replace("CCCC", "CD")
  |> s.replace("DD", "M")
  |> s.replace("DCD", "CM")
}
