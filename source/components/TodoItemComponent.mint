component TodoItemComponent {
  property todo : TodoItem
  property toggleComplete : Function(TodoItem, Promise(Never, Void))
  property removeTodo : Function(TodoItem, Promise(Never, Void))
  property editTodo : Function(TodoItem, String, Promise(Never, Void))

  state editing = false

  get listClasses : String {
    `Object.entries({
        completed: #{todo.completed},
        editing: #{editing}
      })
      .filter(([k,v]) => v)
      .map(([k]) => k).join(" ")
    `
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
