component Main {
  connect Application exposing { page }

  style linkitem {
    margin-left: 8px;
  }

  fun render : Html {
    <div>
      <div>
        <a href="/register">
          "Register"
        </a>

        <a::linkitem href="/login">
          "Login"
        </a>

        <a::linkitem href="/aaaaaaaaaaaaaaaaaa">
          "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"
        </a>

        <a::linkitem href="/">
          "Home"
        </a>
      </div>

      <hr/>

      case (page) {
        Page::Register =>
          <div>
            "Register"
          </div>

        Page::NotFound =>
          <div>
            "404"
          </div>

        Page::Login =>
          <div>
            "Login"
          </div>

        Page::Home =>
          <div>
            "Home"
          </div>

        Page::Initial => <div/>
      }
    </div>
  }
}
