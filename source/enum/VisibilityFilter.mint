enum VisibilityFilterEnum {
  ShowAll
  ShowActive
  ShowCompleted
}

module VisibilityFilterModule {
  fun toString (item : VisibilityFilterEnum) : String {
    case (item) {
      VisibilityFilterEnum::ShowAll => "All"
      VisibilityFilterEnum::ShowActive => "Active"
      VisibilityFilterEnum::ShowCompleted => "Completed"
    }
  }

  fun fromString (item : String) : Maybe(VisibilityFilterEnum) {
    case (item) {
      "All" => Maybe.just(VisibilityFilterEnum::ShowAll)
      "Active" => Maybe.just(VisibilityFilterEnum::ShowActive)
      "Completed" => Maybe.just(VisibilityFilterEnum::ShowCompleted)
      => Maybe.nothing()
    }
  }
}
