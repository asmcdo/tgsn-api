defmodule TgsnApi.Operation do
  alias TgsnApi.{Repo, User}

  use Ecto.Repo

  import Ecto.Changeset, Bycript

  def get_user(user_id) do
    Repo.get(User, user_id)
    |> Map.take([:name, :username, :email, :password])
    |> Poison.encode
  end

  def create_user(new_user) do
    %User{}
    |> User.changeset(new_user)
    |> validate_fields
    |> encode_password
    |> Repo.insert!()
  end

  def login(user) do
    #TODO: verify if user exists in DB.
  end

  defp encode_password(%Ecto.Changeset{valid?: true, changes: %{password: password}} = changeset) do
    change(changeset, add_hash(password))
  end

  defp encode_password(changeset) do
    changeset
  end

  defp validate_password(user) do
    #TODO: check if  given password is correct
  end

  defp validate_fields(changeset) do
    put_change(changeset, :valid?, verify_existing_fields(changeset))
  end

  defp verify_existing_fields(changeset) do
    # Naive approach, still to find a better way to implement it
    query = from u in User, where: (u.username == ^changeset.username) or (u.email == ^changeset.email)
    Repo.exists?(query)
  end
end
