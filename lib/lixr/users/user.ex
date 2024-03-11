defmodule Lixr.Users.User do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "users" do
    field :full_name, :string
    field :gender, :string
    field :bio, :string
    belongs_to :account, Lixr.Accounts.Account

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:account_id, :full_name, :gender, :bio])
    |> validate_required([:account_id])
  end
end
