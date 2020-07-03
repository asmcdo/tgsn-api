defmodule TgsnApi.Repo do
  use Ecto.Repo,
    otp_app: :tgsn_api,
    adapter: Ecto.Adapters.Postgres
end
