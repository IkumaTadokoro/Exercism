import gleam/int
import gleam/iterator
import gleam/list

pub fn rows(n: Int) -> List(List(Int)) {
  [1]
  |> iterator.iterate(row)
  |> iterator.take(n)
  |> iterator.to_list
}

fn row(prev_row: List(Int)) -> List(Int) {
  let center = prev_row |> list.window(2) |> list.map(int.sum)
  list.concat([[1], center, [1]])
}
