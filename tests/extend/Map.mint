suite "Map.Extra.entries" {
  test "returns an array of key-value tuple" {
    (Map.empty()
    |> Map.set("foo", 100)
    |> Map.set("bar", 200)
    |> Map.Extra.entries()) == [{"foo", 100}, {"bar", 200}]
  }

  test "returns an array of key-value tuple" {
    (Map.empty()
    |> Map.set(100, "foo")
    |> Map.set(200, "bar")
    |> Map.Extra.entries()) == [{100, "foo"}, {200, "bar"}]
  }

  test "returns an array of key-value tuple" {
    (Map.empty()
    |> Map.Extra.entries()) == []
  }
}
