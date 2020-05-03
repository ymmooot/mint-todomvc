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
        for (filter of FILTER_TITLES) {
          <li>
            <Link
              onClick={(event : Html.Event) { setVisibilityFilter(filter) }}
              active={filter == visibilityFilter}>

              <{ VisibilityFilterModule.toString(filter) }>

            </Link>
          </li>
        }
      </ul>

      if (completedCount > 0) {
        <button
          class="clear-completed"
          onClick={onClearCompleted}>

          "Clear completed"

        </button>
      }
    </footer>
  }
}
