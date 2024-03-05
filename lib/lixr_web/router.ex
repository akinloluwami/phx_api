defmodule LixrWeb.Router do
  use LixrWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", LixrWeb do
    pipe_through :api
  end
end
