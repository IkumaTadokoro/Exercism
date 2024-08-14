pub fn reply(guess: Int) -> String {
  case guess {
    42 -> "Correct"
    41 | 43 -> "So close"
    g if g < 42 -> "Too low"
    g if g > 42 -> "Too high"
    _ -> "Invalid guess"
  }
}
