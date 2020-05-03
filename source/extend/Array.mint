module Array.Extra {
  /*
  Returns `true` if all item in the array matches the predicate function
  `false` otherwise.

    Array.Extra.all((number : Number) : Bool { number % 2 == 0 }, [2, 4, 6, 8]) == true
    Array.Extra.all((number : Number) : Bool { number % 2 == 0 }, [2, 4, 5]) == false
  */
  fun all (func : Function(a, Bool), ary : Array(a)) : Bool {
    !(ary
    |> (Array.any(
      (item : a) : Bool {
        !(func(item))
      })))
  }

  /*
  Returns joined string

    Array.Extra.join(",", ["a", "b", "c"]) == "a,b,c"
  */
  fun join (glue : String, ary : Array(String)) : String {
    ary
    |> Array.reduce(
      "",
      (memo : String, item : String) : String {
        case (memo) {
          "" => item

          => "#{memo}#{glue}#{item}"
        }
      })
  }
}
