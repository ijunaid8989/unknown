defmodule Socialistical.Repo.Migrations.CreateUser do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :firstname, :string
      add :lastname, :string
      add :email, :string
      add :username, :string
      add :password, :string
      add :password_confirmation, :string, virtual: true
      add :last_signed_in, :utc_datetime

      timestamps()
    end
    create unique_index(:users, [:email])
    create unique_index(:users, [:username])

  end
end
