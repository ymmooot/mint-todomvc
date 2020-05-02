component Footer {
  property completedCount : Number
  property activeCount : Number
  property visibilityFilter : VisibilityFilterEnum
  property setVisibilityFilter : Function(VisibilityFilterEnum, Promise(Never, Void))
  property onClearCompleted : Function(Promise(Never, Void))

  const FILTER_TITLES = [
    VisibilityFilterEnum::ShowAll,
    VisibilityFilterEnum::ShowActive,
    VisibilityFilterEnum::ShowCompleted
  ]

  get itemWord : String {
    if (activeCount == 1) {
      "item"
    } else {
      "items"
    }
  }

  get activeCountWord : String {
    if (activeCount == 0) {
      "No"
    } else {
      Number.toString(activeCount)
    }
  }

  get filterTitles : Array(String) {
    FILTER_TITLES
    |> Array.map(VisibilityFilterModule.toString)
  }

  fun filterSelected (e : Html.Event) : Promise(Never, void) {
    `#{e.target}.innerText`
    |> VisibilityFilterModule.fromString()
    |> Result.withDefault(VisibilityFilterEnum::ShowAll)
    |> setVisibilityFilter()
  }

  fun render : Html {
    <footer class="footer">
      <span class="todo-count">
        <strong>
          <{ activeCountWord }>
        </strong>

        " "
        <{ itemWord }>
        " left"
      </span>

      <ul class="filters">
        <{
          Array.map(
            (filter : String) : Html {
              <li>
                <Link
                  active={filter == VisibilityFilterModule.toString(visibilityFilter)}
                  onClick={filterSelected}>

                  <{ filter }>

                </Link>
              </li>
            },
            filterTitles)
        }>
      </ul>

      <If condition={completedCount > 0}>
        <button
          class="clear-completed"
          onClick={onClearCompleted}>

          "Clear completed"

        </button>
      </If>
    </footer>
  }
}
