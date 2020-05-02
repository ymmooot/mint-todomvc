component Header {
  connect Todos exposing { add }

  state value : String = ""

  fun handleSubmit (text : String) : Promise(Never, Void) {
    text
    |> String.trim()
    |> add
  }

  fun render : Html {
    <header className="header">
      <h1>
        "todos"
      </h1>

      <TodoTextInput
        isNewItem={true}
        placeholder="What needs to be done?"
        onSubmit={handleSubmit}/>
    </header>
  }
}
