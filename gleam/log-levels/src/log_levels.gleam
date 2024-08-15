import gleam/string

type LogEntry {
  LogEntry(level: String, message: String)
}

fn parse_log_line(log_line: String) -> LogEntry {
  case log_line |> string.trim() |> string.split("]: ") {
    ["[" <> level, message] ->
      LogEntry(level |> string.lowercase(), message |> string.trim())
    _ -> LogEntry("", "")
  }
}

pub fn message(log_line: String) -> String {
  let LogEntry(_, message) = parse_log_line(log_line)
  message
}

pub fn log_level(log_line: String) -> String {
  let LogEntry(level, _) = parse_log_line(log_line)
  level
}

pub fn reformat(log_line: String) -> String {
  let LogEntry(level, message) = parse_log_line(log_line)
  message <> " (" <> level <> ")"
}
