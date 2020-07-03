defmodule TgsnApi.User do
  use Ecto.Schema
  import Ecto.Changeset

  schema "tgsn_user" do
    field(:name, :string)
    field(:username, :string)
    field(:email, :string)
    field(:password, :string)

    timestamps()
  end

  def changeset(struct, params) do
    struct
    |> cast(params, [:name, :username, :email, :password])
    |> validate_required([:name, :username, :email, :password])
    |> validate_length(:password, min: 6)
  end
end
