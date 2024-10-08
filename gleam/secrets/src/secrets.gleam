pub fn secret_add(secret: Int) -> fn(Int) -> Int {
  fn(x: Int) -> Int { secret + x }
}

pub fn secret_subtract(secret: Int) -> fn(Int) -> Int {
  fn(x: Int) -> Int { x - secret }
}

pub fn secret_multiply(secret: Int) -> fn(Int) -> Int {
  fn(x: Int) -> Int { secret * x }
}

pub fn secret_divide(secret: Int) -> fn(Int) -> Int {
  fn(x: Int) -> Int { x / secret }
}

pub fn secret_combine(
  secret_function1: fn(Int) -> Int,
  secret_function2: fn(Int) -> Int,
) -> fn(Int) -> Int {
  fn(x: Int) -> Int { x |> secret_function1 |> secret_function2 }
}
