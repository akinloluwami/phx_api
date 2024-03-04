defmodule PhxApi.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      PhxApiWeb.Telemetry,
      PhxApi.Repo,
      {DNSCluster, query: Application.get_env(:phx_api, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: PhxApi.PubSub},
      # Start the Finch HTTP client for sending emails
      {Finch, name: PhxApi.Finch},
      # Start a worker by calling: PhxApi.Worker.start_link(arg)
      # {PhxApi.Worker, arg},
      # Start to serve requests, typically the last entry
      PhxApiWeb.Endpoint
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: PhxApi.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    PhxApiWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
