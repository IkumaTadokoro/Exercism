import gleam/dict
import gleam/list
import gleam/result
import gleam/string

const dna_rna_list = [#("G", "C"), #("C", "G"), #("T", "A"), #("A", "U")]

fn dna_to_rna(dna: String) -> Result(String, Nil) {
  dna_rna_list
  |> dict.from_list
  |> dict.get(dna)
}

pub fn to_rna(dna: String) -> Result(String, Nil) {
  dna
  |> string.split("")
  |> list.try_fold("", fn(acc, dna) {
    dna_to_rna(dna) |> result.map(fn(rna) { acc <> rna })
  })
}
