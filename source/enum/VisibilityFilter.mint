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
      "All" => Maybe::Just(VisibilityFilterEnum::ShowAll)
      "Active" => Maybe::Just(VisibilityFilterEnum::ShowActive)
      "Completed" => Maybe::Just(VisibilityFilterEnum::ShowCompleted)
      => Maybe::Nothing
    }
  }
}
