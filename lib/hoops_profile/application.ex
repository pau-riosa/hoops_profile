defmodule HoopsProfile.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      HoopsProfileWeb.Telemetry,
      HoopsProfile.Repo,
      {DNSCluster, query: Application.get_env(:hoops_profile, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: HoopsProfile.PubSub},
      # Start the Finch HTTP client for sending emails
      {Finch, name: HoopsProfile.Finch},
      # Start a worker by calling: HoopsProfile.Worker.start_link(arg)
      # {HoopsProfile.Worker, arg},
      # Start to serve requests, typically the last entry
      HoopsProfileWeb.Endpoint
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: HoopsProfile.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    HoopsProfileWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
