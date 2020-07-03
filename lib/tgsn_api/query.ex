defmodule TgsnApi.Query do
  alias TgsnApi.{Repo, User}

  def get_user(user_id) do
    Repo.get(User, user_id)
    |> Map.take([:name, :username, :email, :password])
    |> Poison.encode
  end
end
