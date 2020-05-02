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

  fun fromString (item : String) : Result(error, VisibilityFilterEnum) {
    case (item) {
      "All" => Result.ok(VisibilityFilterEnum::ShowAll)
      "Active" => Result.ok(VisibilityFilterEnum::ShowActive)
      "Completed" => Result.ok(VisibilityFilterEnum::ShowCompleted)
      => Result.error("error")
    }
  }
}
