store VisibilityFilter {
  state visibilityFilter : VisibilityFilterEnum = VisibilityFilterEnum::ShowAll

  fun set (fitler : VisibilityFilterEnum) : Promise(Never, Void) {
    next { visibilityFilter = fitler }
  }
}
