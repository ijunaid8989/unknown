defmodule Socialistical.DashboardController do
  use Socialistical.Web, :controller
  import Socialistical.Session
  alias Socialistical.User

  def index(conn, _params) do
    with %Socialistical.User{} <- current_user(conn) do
      render conn, "index.html"
    else
      _ ->
        conn
        |> put_flash(:error, "You must be logged in to see that page :).")
        |> redirect(to: "/sign_in")
    end
  end
end
