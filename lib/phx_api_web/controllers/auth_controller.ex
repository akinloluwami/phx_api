defmodule PhxApiWeb.AuthController do
  use PhxApiWeb, :controller



  def signup(conn, params) do
    changeset = User.changeset(%User{}, params)

    case PhxApi.Repo.insert(changeset) do
      {:ok, user} ->
        conn
        |> put_status(:created)
        |> 'Created'

      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(YourProjectNameWeb.ChangesetView, "error.json", changeset: changeset)
    end

  end



end
