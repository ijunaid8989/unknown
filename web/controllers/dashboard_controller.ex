defmodule Unknown.DashboardController do
  use Unknown.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
