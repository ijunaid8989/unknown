defmodule Socialistical.UserController do
  use Socialistical.Web, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end

  def sign_up(conn, _params) do
    render(conn, "sign_up.html")
  end
end
