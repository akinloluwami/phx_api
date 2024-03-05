defmodule Lixr.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      LixrWeb.Telemetry,
      Lixr.Repo,
      {DNSCluster, query: Application.get_env(:lixr, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: Lixr.PubSub},
      # Start the Finch HTTP client for sending emails
      {Finch, name: Lixr.Finch},
      # Start a worker by calling: Lixr.Worker.start_link(arg)
      # {Lixr.Worker, arg},
      # Start to serve requests, typically the last entry
      LixrWeb.Endpoint
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Lixr.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    LixrWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
