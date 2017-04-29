defmodule Socialistical.Router do
  use Socialistical.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
    plug CORSPlug, origin: ["*"]
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", Socialistical do
    pipe_through :browser # Use the default browser stack


    get "/", UserController, :index
    get "/sign_up", UserController, :sign_up
    post "/create_user", UserController, :create
    options "/create_user", UserController, :nothing

    # resources "/users", UserController, except: [:new, :edit]
  end

  # Other scopes may use custom stacks.
  # scope "/api", Socialistical do
  #   pipe_through :api
  # end
end
