defmodule PhxApiWeb.Router do
  use PhxApiWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/todos", PhxApiWeb do
    pipe_through :api

    get "/", TodosController, :todos
    get "/:id", TodosController, :show

  end
end
