defmodule LixrWeb.DefaultController do
  use LixrWeb, :controller

  def index(conn, _params) do
    text(conn, "Hello World! - #{Mix.env()}")
  end
end
