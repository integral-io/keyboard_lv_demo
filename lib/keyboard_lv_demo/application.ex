defmodule KeyboardLvDemo.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      KeyboardLvDemo.Repo,
      # Start the Telemetry supervisor
      KeyboardLvDemoWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: KeyboardLvDemo.PubSub},
      # Start the Endpoint (http/https)
      KeyboardLvDemoWeb.Endpoint
      # Start a worker by calling: KeyboardLvDemo.Worker.start_link(arg)
      # {KeyboardLvDemo.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: KeyboardLvDemo.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    KeyboardLvDemoWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
