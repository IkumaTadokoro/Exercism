import gleam/option.{type Option}

pub fn two_fer(name: Option(String)) -> String {
  "One for " <> name |> option.unwrap("you") <> ", one for me."
}
