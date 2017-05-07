defmodule Socialistical.SessionController do
  use Socialistical.Web, :controller

  def create(conn, params) do
    case Socialistical.Session.login(params, Socialistical.Repo) do
      {:ok, user} ->
        Socialistical.Session.update_last_login(params, Socialistical.Repo)
        conn
        |> put_session(:current_user, user.id)
        |> put_flash(:info, "You have logged in.")
        |> redirect(to: "/dashboard")
      :error ->
        conn
        |> put_flash(:error, "Wrong email or password.")
        |> redirect(to: "/sign_in")
    end
  end

  def delete(conn, _) do
    conn
    |> delete_session(:current_user)
    |> put_flash(:info, "Logged out")
    |> redirect(to: "/sign_in")
  end
end
