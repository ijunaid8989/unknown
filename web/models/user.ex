defmodule Socialistical.User do
  use Socialistical.Web, :model

  schema "users" do
    field :firstname, :string
    field :lastname, :string
    field :email, :string
    field :username, :string
    field :password, :string
    field :last_signed_in, Ecto.DateTime

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:firstname, :lastname, :email, :username, :password, :last_signed_in])
    |> validate_required([:firstname, :lastname, :email, :username, :password, :last_signed_in])
    |> unique_constraint(:email)
    |> unique_constraint(:username)
  end
end
