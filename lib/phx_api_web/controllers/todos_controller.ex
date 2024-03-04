defmodule PhxApiWeb.TodosController do
  use PhxApiWeb, :controller

  def todos(conn, _params) do
    todos = [
      %{id: 1, title: "Fix Github auth bug", isDone: false}
    ]

    json(conn, todos)

  end

end
