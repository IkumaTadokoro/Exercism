import gleam/result

pub type Player {
  Black
  White
}

pub type Game {
  Game(
    white_captured_stones: Int,
    black_captured_stones: Int,
    player: Player,
    error: String,
  )
}

pub fn apply_rules(
  game: Game,
  rule1: fn(Game) -> Result(Game, String),
  rule2: fn(Game) -> Game,
  rule3: fn(Game) -> Result(Game, String),
  rule4: fn(Game) -> Result(Game, String),
) -> Game {
  let game_with_rules =
    game
    |> rule1
    |> result.map(rule2)
    |> result.try(rule3)
    |> result.try(rule4)

  case game_with_rules {
    Ok(game_res) -> {
      case game_res.player {
        White -> Game(..game_res, player: Black)
        Black -> Game(..game_res, player: White)
      }
    }
    Error(error) -> {
      Game(..game, error: error)
    }
  }
}
