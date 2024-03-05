defmodule PhxApiWeb.Router do
  use PhxApiWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/todos", PhxApiWeb do
    pipe_through :api

    get "/", TodosController, :index
    get "/:id", TodosController, :show

  end


  scope "/auth", PhxApiWeb do
    pipe_through :api

    post "/signup", AuthController, :signup
  end

end
