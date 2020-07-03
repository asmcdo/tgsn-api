import Config

config :tgsn_api, TgsnApi.Repo,
  database: "tgsn_api_repo",
  username: "postgres",
  password: "tgsn123",
  hostname: "localhost"

config :tgsn_api,
  ecto_repos: [TgsnApi.Repo]

config :tgsn_api,
  port: 3000
