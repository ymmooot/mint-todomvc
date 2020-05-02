component Link {
  property children : Array(Html) = []
  property onClick : Function(Html.Event, Promise(Never, Void))
  property active = false

  style link {
    cursor: pointer;
  }

  fun render : Html {
    <a::link
      class={
        if (active) {
          "selected"
        } else {
          ""
        }
      }
      onClick={onClick}>

      <{ children }>

    </a>
  }
}
