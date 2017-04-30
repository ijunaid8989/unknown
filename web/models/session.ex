defmodule Socialistical.Session do
  alias Socialistical.User
  require Logger

  def login(params, repo) do
    user = repo.get_by(User, email: String.downcase(params["email"]))
    case authenticate(user, params["password"]) do
      true -> {:ok, user}
      _    -> :error
    end
  end

  defp authenticate(user, password) do
    case user do
      nil -> false
      _   -> Comeonin.Bcrypt.checkpw(password, user.password)
    end
  end

  def current_user(conn) do
    id = Plug.Conn.get_session(conn, :current_user)
    if id, do: Socialistical.Repo.get(User, id)
  end

  def logged_in?(conn), do: !!current_user(conn)

  def update_last_login(params, repo) do
    user = repo.get_by(User, email: String.downcase(params["email"]))
    case user |> User.changeset(%{"last_signed_in" => Ecto.DateTime.utc }) |> Socialistical.Repo.insert_or_update do
      {:ok, _user} ->
        Logger.info "Last signed in updated!"
      {:error, _changeset} ->
        Logger.error "Last signed in not updated!"
    end
  end
end
