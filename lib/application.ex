defmodule TgsnApi.Application do
  @moduledoc false

  use Application
  require Logger

  def start(_type, _args) do
    children = [
      {Plug.Cowboy, scheme: :http, plug: TgsnApi.Router, options: [port: get_port()]},
      {TgsnApi.Repo, []}
    ]

    Logger.info("Starting application...")

    opts = [strategy: :one_for_one, name: TgsnApi.Supervisor]
    Supervisor.start_link(children, opts)
  end

  defp get_port do
    Application.fetch_env!(:tgsn_api, :port)
  end
end
