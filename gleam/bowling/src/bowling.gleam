import gleam/int
import gleam/list

pub opaque type Frame {
  // rolls and bonus rolls are stored in reverse order
  Frame(number: Int, rolls: List(Int), bonus: List(Int))
}

pub type Game {
  // list of frames is stored in reverse order
  Game(frames: List(Frame))
}

pub type Error {
  InvalidPinCount
  GameComplete
  GameNotComplete
}

type FrameState {
  TenthFrameComplete
  FrameComplete
  IncompleteFrame(IncompleteFrameState)
}

type IncompleteFrameState {
  AwaitingFillBall(remaining_pins: Int)
  AwaitingBall(remaining_pins: Int)
}

pub fn roll(game: Game, knocked_pins: Int) -> Result(Game, Error) {
  let #(recent_frame, previous_frames) = get_recent_frame(game.frames)
  let recent_frame_state = frame_state(recent_frame)
  use <- validate_game_not_complete(recent_frame_state)
  let #(current_frame, incomplete_frame_state, previous_frames) =
    get_current_frame(recent_frame, recent_frame_state, previous_frames)
  use <- validate_knocked_pins(knocked_pins, incomplete_frame_state)
  let updated_frame =
    update_frame(current_frame, knocked_pins, incomplete_frame_state)
  Ok(Game([updated_frame, ..previous_frames]))
}

fn get_recent_frame(frames) {
  case frames {
    [] -> #(Frame(1, [], []), frames)
    [frame, ..rest] -> #(frame, rest)
  }
}

fn frame_state(frame: Frame) {
  let rolls = list.length(frame.rolls)
  let knocked_in_frame = int.sum(frame.rolls)
  let bonus_rolls = list.length(frame.bonus)
  let knocked_in_bonus = int.sum(frame.bonus)
  case frame.number, rolls, knocked_in_frame, bonus_rolls, knocked_in_bonus {
    // 10th frame strike, 2 bonus rolls done -> game complete
    10, 1, 10, 2, _ -> TenthFrameComplete
    // 10th frame spare, 1 bonus roll done -> game complete
    10, 2, 10, 1, _ -> TenthFrameComplete
    // 10th frame, 2 rolls done -> game complete
    10, 2, knocked_in_frame, _, _ if knocked_in_frame < 10 -> TenthFrameComplete
    // 10th frame strike, 1 bonus roll knocked some -> bonus roll with some standing
    10, 1, 10, 1, knocked_in_bonus if knocked_in_bonus < 10 ->
      IncompleteFrame(AwaitingFillBall(10 - knocked_in_bonus))
    // 10th frame strike or spare -> bonus roll with 10 standing
    10, _, 10, _, _ -> IncompleteFrame(AwaitingFillBall(10))
    // 1-9th frame strike or spare -> new frame
    _, _, 10, _, _ -> FrameComplete
    // 1-9th frame, 2 rolls done -> new frame
    _, 2, _, _, _ -> FrameComplete
    // open frame -> 2nd roll
    _, _, n, _, _ -> IncompleteFrame(AwaitingBall(10 - n))
  }
}

fn validate_game_not_complete(recent_frame_state, callback) {
  case recent_frame_state {
    TenthFrameComplete -> Error(GameComplete)
    _state -> callback()
  }
}

fn get_current_frame(recent_frame, recent_frame_state, previous_frames) {
  case recent_frame, recent_frame_state {
    _, IncompleteFrame(state) -> #(recent_frame, state, previous_frames)
    Frame(number: n, ..), _ -> #(Frame(n + 1, [], []), AwaitingBall(10), [
      recent_frame,
      ..previous_frames
    ])
  }
}

fn validate_knocked_pins(knocked_pins, incomplete_frame_state, callback) {
  let remaining_pins = get_remaining_pins(incomplete_frame_state)
  case knocked_pins {
    n if n < 0 || n > 10 || n > remaining_pins -> Error(InvalidPinCount)
    _n -> callback()
  }
}

fn get_remaining_pins(incomplete_frame_state) {
  case incomplete_frame_state {
    AwaitingFillBall(remaining_pins) -> remaining_pins
    AwaitingBall(remaining_pins) -> remaining_pins
  }
}

fn update_frame(frame, knocked_pins, incomplete_frame_state) {
  case incomplete_frame_state {
    AwaitingFillBall(_) -> Frame(..frame, bonus: [knocked_pins, ..frame.bonus])
    AwaitingBall(_) -> Frame(..frame, rolls: [knocked_pins, ..frame.rolls])
  }
}

pub fn score(game: Game) -> Result(Int, Error) {
  use last_frame, rest <- validate_last_frame_for_scoring(game)
  let initial_score = int.sum(last_frame.rolls) + int.sum(last_frame.bonus)
  // last frame will always have at least 2 throws
  let assert [throw1, throw2, ..] =
    list.flatten([
      list.reverse(last_frame.rolls),
      list.reverse(last_frame.bonus),
    ])
  let #(score, _, _) =
    list.fold(rest, #(initial_score, throw1, throw2), fn(acc, frame) {
      let #(score, throw1, throw2) = acc
      case frame.rolls, int.sum(frame.rolls) {
        // strike
        [10], _ -> #(score + 10 + throw1 + throw2, 10, throw1)
        // spare
        [b, a], 10 -> #(score + 10 + throw1, a, b)
        // open frame
        [b, a], n -> #(score + n, a, b)
        _, _ -> panic as "unreachable"
      }
    })
  Ok(score)
}

fn validate_last_frame_for_scoring(
  game,
  callback: fn(Frame, List(Frame)) -> Result(a, Error),
) -> Result(a, Error) {
  case game {
    Game([]) -> Error(GameNotComplete)
    Game([Frame(number: n, ..), ..]) if n != 10 -> Error(GameNotComplete)
    Game([last_frame, ..rest]) ->
      case frame_state(last_frame) {
        state if state != TenthFrameComplete -> Error(GameNotComplete)
        _state -> callback(last_frame, rest)
      }
  }
}
