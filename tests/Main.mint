suite "Main" {
  test "Links" {
    with Test.Html {
      <Main/>
      |> start()
      |> assertTextOf("a", "Register")
      |> assertTextOf("a:nth-child(2)", "Login")
      |> assertTextOf("a:nth-child(3)", "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa")
      |> assertTextOf("a:nth-child(4)", "Home")
    }
  }
}
