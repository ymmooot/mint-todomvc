suite "Array.Extra.all" {
  test "returns true if all items match the predicate" {
    [2, 4, 6, 8, 10, 12]
    |> Array.Extra.all((number : Number) : Bool { number % 2 == 0 })
  }

  test "returns false if finds item that does not match the predicate" {
    ([2, 4, 6, 8, 10, 12, 13]
    |> Array.Extra.all((number : Number) : Bool { number % 2 == 0 })) == false
  }

  test "returns true if array length is 0" {
    []
    |> Array.Extra.all((number : Number) : Bool { number % 2 == 0 })
  }
}

suite "Array.Extra.join" {
  test "returns joined string" {
    (["a", "b", "c"]
    |> Array.Extra.join(",")) == "a,b,c"
  }

  test "returns an empty string if array length is 0" {
    ([]
    |> Array.Extra.join(",")) == ""
  }
}
