defmodule TgsnApi.Operation do
  alias TgsnApi.{Repo, User}

  alias TgsnApi.Repo

  import Ecto.{Query, Changeset}

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
    user_credentials = 
    %Ecto.Changeset{valid?: true, changes: %{email: user[email], password: user[password]}}
    |> validate_fields
    |> validate_credentials
  end

  defp encode_password(%Ecto.Changeset{valid?: true, changes: %{password: password}} = changeset) do
    #change(changeset, add_hash(password))
  end

  defp encode_password(changeset) do
    changeset
  end

  defp validate_credentials(%Ecto.Changeset{valid?: true, changes: %{password: password}} = changeset) do
    #TODO decrypt password
    query = from u in User, where: (u.email == changeset.email) and (u.password == changeset.password)
  end

  defp validate_credentials(changeset) do
    changeset
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
