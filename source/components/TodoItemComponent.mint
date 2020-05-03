component TodoItemComponent {
  property todo : TodoItem
  property toggleComplete : Function(TodoItem, Promise(Never, Void))
  property removeTodo : Function(TodoItem, Promise(Never, Void))
  property editTodo : Function(TodoItem, String, Promise(Never, Void))

  state editing = false

  get listClasses : String {
    try {
      classMap =
        Map.empty()
        |> Map.set("completed", todo.completed)
        |> Map.set("editing", editing)

      for (name, active of classMap) {
        name
      } when {
        active
      }
      |> String.join(" ")
    }
  }

  fun handleDoubleClick {
    next { editing = true }
  }

  fun handleSubmitEdit (text : String) {
    sequence {
      editTodo(todo, text)
      next { editing = false }
    }
  }

  fun render : Html {
    <li class={listClasses}>
      if (editing) {
        <TodoTextInput
          placeholder=""
          text={todo.text}
          isNewItem={false}
          onSubmit={handleSubmitEdit}/>
      } else {
        <div class="view">
          <input
            class="toggle"
            type="checkbox"
            checked={todo.completed}
            onChange={() { toggleComplete(todo) }}/>

          <label onDoubleClick={handleDoubleClick}>
            <{ todo.text }>
          </label>

          <button
            class="destroy"
            onClick={() { removeTodo(todo) }}/>
        </div>
      }
    </li>
  }
}
