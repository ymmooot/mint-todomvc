routes {
  /register {
    Application.setPage(Page::Register)
  }

  /login {
    Application.setPage(Page::Login)
  }

  / {
    Application.setPage(Page::Home)
  }

  * {
    Application.setPage(Page::NotFound)
  }
}
