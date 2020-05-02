component MainSection {
  connect Todos exposing { todosCount, completedCount, clearCompleted, completeAllTodos }
  connect VisibilityFilter exposing { visibilityFilter, set }

  fun render : Html {
    <section className="main">
      <If condition={todosCount > 0}>
        <span>
          <input
            class="toggle-all"
            type="checkbox"
            checked={completedCount == todosCount}
            readOnly={true}
            onClick={completeAllTodos}/>

          <label onClick={completeAllTodos}/>
        </span>
      </If>

      <VisibleTodoList/>

      <If condition={todosCount > 0}>
        <Footer
          completedCount={completedCount}
          activeCount={todosCount - completedCount}
          visibilityFilter={visibilityFilter}
          setVisibilityFilter={set}
          onClearCompleted={clearCompleted}/>
      </If>
    </section>
  }
}
