component TodoTextInput {
  property placeholder : String
  property onSubmit : Function(String, Promise(Never, Void))
  property text : String = ""
  property isNewItem : Bool

  state value : String = text

  fun componentDidMount : Promise(Never, Void) {
    Dom.focus(input)
  }

  get classes : String {
    try {
      classMap =
        Map.empty()
        |> Map.set("new-todo", isNewItem)
        |> Map.set("edit", !isNewItem)

      for (name, active of classMap) {
        name
      } when {
        active
      }
      |> String.join(" ")
    }
  }

  fun handleInput (event : Html.Event) : Promise(Never, Void) {
    next { value = Dom.getValue(event.target) }
  }

  fun handleKeyDown (event : Html.Event) : Promise(Never, Void) {
    case (event.which) {
      13 => submitValue()
      27 => clearValue()
      => next {  }
    }
  }

  fun handleBlur (event : Html.Event) : Promise(Never, Void) {
    if (!isNewItem) {
      submitValue()
    } else {
      next {  }
    }
  }

  fun clearValue : Promise(Never, Void) {
    next { value = "" }
  }

  fun submitValue : Promise(Never, Void) {
    sequence {
      onSubmit(value)
      clearValue()
    }
  }

  fun render : Html {
    <input as input
      type="text"
      class={classes}
      placeholder={placeholder}
      onInput={handleInput}
      onKeyDown={handleKeyDown}
      onBlur={handleBlur}
      value={value}/>
  }
}
