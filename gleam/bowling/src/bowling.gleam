import gleam/int
import gleam/io
import gleam/list

// entry point for debug
pub fn main() {
  let rolls = list.repeat(1, times: 20)
  rolls
  |> list.fold(Game([]), fn(game, pins) {
    let assert Ok(new_game) = roll(game, pins)
    new_game
  })
  |> score
  |> io.debug
}

pub type Roll {
  BeforeThrow
  WaitingNextThrow(Int)
  OpenFrame(Int, Int)
}

pub opaque type Frame {
  Frame(rolls: Roll, bonus: List(Int))
}

pub type Game {
  Game(frames: List(Frame))
}

pub type Error {
  InvalidPinCount
  GameComplete
  GameNotComplete
}

pub fn roll(game: Game, knocked_pins: Int) -> Result(Game, Error) {
  // 10フレーム目以外を考える。
  // 1回目の1投目がストライクではないケースが一番単純なケース。例えば 1回目の投球が4だったとしよう。
  // この場合 Game([Frame(rolls: [4],  bonus: [])]) がかえるのがよさそう。
  // では2投目を投げる。これも特殊でないケースとしてスペアではなく、例えば3ピン倒したとしよう。
  // この場合は、Game([Frame(rolls: [4, 3], bonus: [])])となるのが良さそう。
  // ここからFrameの持っているrollsには少なくとも、3つの状態があることが分かる。

  // まず現在のフレームを取得する。
  let current_frame = case game.frames {
    [Frame(WaitingNextThrow(x), _), ..] -> Frame(WaitingNextThrow(x), [])
    // 1投目を投げている場合
    _ -> Frame(BeforeThrow, [])
    // 1投も投げていない場合
  }

  // フレームに倒したスコアを記録する
  let new_frame = case current_frame.rolls {
    WaitingNextThrow(x) -> Frame(OpenFrame(x, knocked_pins), [])
    // 1投目を投げている場合
    _ -> Frame(WaitingNextThrow(knocked_pins), [])
    // 1投目の場合
  }

  // Gameを更新する
  case game.frames {
    [Frame(WaitingNextThrow(x), _), ..frames] -> Ok(Game([new_frame, ..frames]))
    _ -> Ok(Game([new_frame, ..game.frames]))
  }
}

pub fn score(game: Game) -> Result(Int, Error) {
  // Game([
  //   Frame(OpenFrame(1, 1), []),
  //   Frame(OpenFrame(1, 1), []),
  //   Frame(OpenFrame(1, 1), []),
  //   Frame(OpenFrame(1, 1), []),
  //   Frame(OpenFrame(1, 1), []),
  //   Frame(OpenFrame(1, 1), []),
  //   Frame(OpenFrame(1, 1), []),
  //   Frame(OpenFrame(1, 1), []),
  //   Frame(OpenFrame(1, 1), []),
  //   Frame(OpenFrame(1, 1), [])
  // ])

  // 例えば愚直に1ピンだけが10フレーム続くシンプルなケースを考える。最終的にはIntでスコアを計算すればいいので、foldしていけば良さそう。
  Ok(
    game.frames
    |> list.fold(0, fn(total, frame) {
      let frame_score = case frame {
        Frame(OpenFrame(first, second), _) -> int.sum([first, second])
        _ -> 0
      }
      total + frame_score
    }),
  )
}
