defmodule Socialistical.SessionController do
  use Socialistical.Web, :controller

  def create(conn, params) do
    case Socialistical.Session.login(params, Socialistical.Repo) do
      {:ok, user} ->
        conn
        |> put_session(:current_user, user.id)
        |> put_flash(:info, "Logged in")
        |> redirect(to: "/dashboard")
      :error ->
        conn
        |> put_flash(:info, "Wrong email or password")
        |> redirect(to: "/")
    end
  end

  def delete(conn, _) do
    conn
    |> delete_session(:current_user)
    |> put_flash(:info, "Logged out")
    |> redirect(to: "/")
  end
end