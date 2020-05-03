record TodoItem {
  text : String,
  completed : Bool,
  id : Number
}

store Todos {
  const LOCAL_STORAGE_KEY = "todos"

  state todos : Array(TodoItem) = [
    {
      text = "Learn Mint!",
      completed = true,
      id = 0
    },
    {
      text = "Learn More Mint!",
      completed = false,
      id = 1
    }
  ]

  get todosCount : Number {
    Array.size(todos)
  }

  get completedCount : Number {
    todos
    |> Array.select(
      (item : TodoItem) : Bool {
        item.completed
      })
    |> Array.size()
  }

  fun add (text : String) : Promise(Never, Void) {
    sequence {
      next { todos = Array.push(newItem, todos) }
      save()
    }
  } where {
    nextId =
      todos
      |> Array.map((todo : TodoItem) : Number { todo.id })
      |> Array.max()
      |> Maybe.withDefault(0)

    newItem =
      {
        id = nextId + 1,
        completed = false,
        text = text
      }
  }

  fun remove (item : TodoItem) : Promise(Never, Void) {
    sequence {
      next { todos = updatedtodos }
      save()
    }
  } where {
    updatedtodos =
      todos
      |> Array.reject((todo : TodoItem) : Bool { todo == item })
  }

  fun edit (target : TodoItem, text : String) : Promise(Never, Void) {
    sequence {
      next { todos = updatedtodos }
      save()
    }
  } where {
    updatedtodos =
      todos
      |> Array.map(
        (todo : TodoItem) {
          if (todo.id == target.id) {
            { target | text = text }
          } else {
            todo
          }
        })
  }

  fun toggle (item : TodoItem) : Promise(Never, Void) {
    sequence {
      next { todos = updatedtodos }
      save()
    }
  } where {
    updatedtodos =
      todos
      |> Array.map(
        (todo : TodoItem) : TodoItem {
          if (todo.id == item.id) {
            { item | completed = !item.completed }
          } else {
            todo
          }
        })
  }

  fun load : Promise(Never, Void) {
    try {
      value =
        Storage.Local.get(LOCAL_STORAGE_KEY)

      object =
        Json.parse(value)
        |> Maybe.toResult("")

      decodedtodos =
        decode object as Array(TodoItem)

      next { todos = decodedtodos }
    } catch {
      next {  }
    }
  }

  fun save : Promise(Never, Void) {
    sequence {
      object =
        encode todos

      json =
        Json.stringify(object)

      Storage.Local.set(LOCAL_STORAGE_KEY, json)

      next {  }
    } catch Storage.Error => error {
      next {  }
    }
  }

  fun clearCompleted : Promise(Never, Void) {
    sequence {
      next { todos = updatedtodos }
      save()
    }
  } where {
    updatedtodos =
      todos
      |> Array.reject(
        (item : TodoItem) : Bool { item.completed })
  }

  fun completeAllTodos : Promise(Never, Void) {
    sequence {
      next { todos = updatedtodos }
      save()
    }
  } where {
    areAllCompleted =
      todos
      |> Array.Extra.all((todo : TodoItem) : Bool { todo.completed })

    updatedtodos =
      todos
      |> Array.map(
        (item : TodoItem) : TodoItem { { item | completed = !areAllCompleted } })
  }
}
