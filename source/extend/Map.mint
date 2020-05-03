module Map.Extra {
  fun entries (map : Map(a, b)) : Array(Tuple(a, b)) {
    keys
    |> Array.mapWithIndex(
      (key : a, i : Number) : Tuple(a, b) {
        {key, (Maybe.withDefault(Maybe.nothing(), values[i]))}
      })
  } where {
    keys =
      Map.keys(map)

    values =
      Map.values(map)
  }
}
