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
    with  {:ok, updated_params} <- merge_username(params),
          {:ok, changeset} <- changeset_is_fine(updated_params)
    do
      case Repo.insert(changeset) do
        {:ok, user} ->
          Logger.info "[POST /create_user] [[#{user.username}] [#{user.email}]]"
          conn
          |> put_flash(:info, "Your account has been created. Please login")
          |> put_session(:current_user, user.id)
          |> redirect(to: "/dashboard")
        {:error, changeset} ->
          errors = Util.parse_changeset(changeset)
          traverse_errors = for {_key, values} <- errors, value <- values, do: "#{value}"
          conn
          |> put_flash(:error, traverse_errors |> List.first)
          |> redirect(to: "/sign_up")
      end
    else
      {:error, errors} ->
        error = for {_key, values} <- errors, value <- values, do: "#{value}"
        conn
        |> put_flash(:error, error |> List.first)
        |> redirect(to: "/sign_up")
    end
  end

  defp merge_username(params) do
    username = String.split(params["email"], "@") |> List.first
    {:ok, Map.merge(params, %{"username" => username})}
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
