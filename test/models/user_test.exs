defmodule Socialistical.UserTest do
  use Socialistical.ModelCase

  alias Socialistical.User

  @valid_attrs %{email: "some content", firstname: "some content", last_signed_in: %{day: 17, hour: 14, min: 0, month: 4, sec: 0, year: 2010}, lastname: "some content", password: "some content", username: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = User.changeset(%User{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = User.changeset(%User{}, @invalid_attrs)
    refute changeset.valid?
  end
end
