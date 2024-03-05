defmodule LixrWeb.Router do
  use LixrWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", LixrWeb do
    pipe_through :api

    get "/", DefaultController, :index
  end
end
