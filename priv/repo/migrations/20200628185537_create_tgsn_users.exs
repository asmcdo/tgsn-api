defmodule TgsnApi.Repo.Migrations.CreateTgsnUsers do
  use Ecto.Migration

  def change do
    create table(:tgsn_user) do
      add :name, :string, null: false
      add :username, :string, null: false
      add :email, :string, null: false
      add :password, :string, null: false

      timestamps()
    end
  end
end
