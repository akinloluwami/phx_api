defmodule PhxApiWeb.AuthController do
  use PhxApiWeb, :controller




  def signup(conn, %{"user" => user_params}) do
    changeset = User.changeset(%User{}, user_params)

    case Repo.insert(changeset) do
      {:ok, user} ->
        conn
        |> put_status(:created)
        |> render("show.json", user: user)

      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(YourProjectNameWeb.ChangesetView, "error.json", changeset: changeset)
    end

  end

  def login(conn) do
  end

end
