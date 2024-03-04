defmodule PhxApiWeb.TodosController do
  use PhxApiWeb, :controller

  def index(conn, _params) do
    todos = [
      %{id: 1, title: "Fix Github auth bug", isDone: false}
    ]

    json(conn, todos)

  end

  def show(conn, %{"id"=>id}) do
    todo = fetch_todo(id)

    case todo do
      nil ->
        conn
        |> put_status(:not_found)
        |> json(%{error: "Todo not found"})
      _ ->
        json(conn, todo)
    end

  end

  defp fetch_todo(id) do
      case id do
        "1" -> %{id: 1, title: "Fix Github auth bug", isDone: false}
        "2" -> %{id: 1, title: "Redesign Logdrop's landing page", isDone: false}
        _ -> nil
      end
  end

end
