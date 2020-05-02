component VisibleTodoList {
  connect Todos exposing { todos, toggle, remove, edit }
  connect VisibilityFilter exposing { visibilityFilter }

  get visibleTodos : Array(TodoItem) {
    case (visibilityFilter) {
      VisibilityFilterEnum::ShowAll => todos

      VisibilityFilterEnum::ShowActive =>
        todos
        |> Array.reject((todo : TodoItem) : Bool { todo.completed })

      VisibilityFilterEnum::ShowCompleted =>
        todos
        |> Array.select((todo : TodoItem) : Bool { todo.completed })
    }
  }

  fun render : Html {
    <ul class="todo-list">
      <{
        Array.map(
          (todo : TodoItem) : Html {
            <TodoItemComponent
              todo={todo}
              toggleComplete={toggle}
              removeTodo={remove}
              editTodo={edit}/>
          },
          visibleTodos)
      }>
    </ul>
  }
}
