suite "EArray.all" {
  test "returns true if all items match the predicate" {
    [2, 4, 6, 8, 10, 12]
    |> EArray.all((number : Number) : Bool { number % 2 == 0 })
  }

  test "returns false if finds item that does not match the predicate" {
    ([2, 4, 6, 8, 10, 12, 13]
    |> EArray.all((number : Number) : Bool { number % 2 == 0 })) == false
  }

  test "returns true if array length is 0" {
    []
    |> EArray.all((number : Number) : Bool { number % 2 == 0 })
  }
}
