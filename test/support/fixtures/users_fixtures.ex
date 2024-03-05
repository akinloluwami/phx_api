defmodule Lixr.UsersFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Lixr.Users` context.
  """

  @doc """
  Generate a user.
  """
  def user_fixture(attrs \\ %{}) do
    {:ok, user} =
      attrs
      |> Enum.into(%{
        bio: "some bio",
        full_name: "some full_name",
        gender: "some gender"
      })
      |> Lixr.Users.create_user()

    user
  end
end
