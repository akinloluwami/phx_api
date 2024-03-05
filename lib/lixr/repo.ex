defmodule Lixr.Repo do
  use Ecto.Repo,
    otp_app: :lixr,
    adapter: Ecto.Adapters.Postgres
end
