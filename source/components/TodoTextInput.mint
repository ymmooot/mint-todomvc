component TodoTextInput {
  property placeholder : String
  property onSubmit : Function(String, Promise(Never, Void))
  property text : String = ""
  property isNewItem : Bool

  state value : String = text

  fun componentDidMount : Promise(String, Void) {
    `(() => {
      this.base.focus()
      this.base.onblur = #{handleBlur}
    })()`
  }

  get classes : String {
    `
      Object.entries({
        'todo-text-input': true,
        'new-todo': #{isNewItem},
        edit: !#{isNewItem},
      })
      .filter(([k, v]) => v)
      .map(([k]) => k)
      .join(" ")
    `
  }

  fun handleInput (event : Html.Event) : Promise(Never, Void) {
    next { value = Dom.getValue(event.target) }
  }

  fun handleKeyDown (event : Html.Event) : Promise(Never, Void) {
    case (event.which) {
      13 => submitValue()
      27 => clearValue()
      => Promise.never()
    }
  }

  fun handleBlur (event : Html.Event) : Promise(Never, Void) {
    if (!isNewItem) {
      submitValue()
    } else {
      Promise.never()
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
    <input
      type="text"
      class={classes}
      placeholder={placeholder}
      onInput={handleInput}
      onKeyDown={handleKeyDown}
      value={value}/>
  }
}
