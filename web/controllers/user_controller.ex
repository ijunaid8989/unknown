defmodule Socialistical.UserController do
  use Socialistical.Web, :controller
  alias Socialistical.Repo
  alias Socialistical.User
  alias Socialistical.Util
  require Logger
  require IEx

  def index(conn, _params) do
    render(conn, "index.html")
  end

  def sign_up(conn, _params) do
    render(conn, "sign_up.html")
  end

  def create(conn, params) do
    with {:ok, changeset} <- changeset_is_fine(params)
    do
      changeset = User.changeset(%User{}, params)
      case Repo.insert(changeset) do
        {:ok, user} ->
          Logger.info "[POST /create_user] [[#{user.username}] [#{user.email}]]"
          conn
          |> put_status(:created)
          |> redirect(to: "/sign_up")
        {:error, changeset} ->
          conn |> redirect(to: "/sign_up")
      end
    else
      {:error, errors} ->
        IEx.pry
        
    end
  end

  defp changeset_is_fine(params) do
    case changeset = User.changeset(%User{}, params) do
      %Ecto.Changeset{valid?: true} ->
        {:ok, changeset}
      %Ecto.Changeset{valid?: false} ->
        {:error, Util.parse_changeset(changeset)}
    end
  end
end
