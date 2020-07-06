defmodule TgsnApi.MixProject do
  use Mix.Project

  def project do
    [
      app: :tgsn_api,
      version: "0.1.0",
      elixir: "~> 1.10",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger],
      mod: {TgsnApi.Application, []}
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:plug_cowboy, "~> 2.3"},
      {:poison, "~> 4.0"},
      {:ecto_sql, "~> 3.4"},
      {:postgrex, "~> 0.15.5"},
    ]
  end
end
