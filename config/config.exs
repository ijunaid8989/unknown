# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :unknown,
  ecto_repos: [Unknown.Repo]

# Configures the endpoint
config :unknown, Unknown.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "nYpJWHb+Q45lxE3YLTtTW6+08g4IAM6TUgOYt9UIqGCoQy6nVsu9z7JjEmuTQ7JC",
  render_errors: [view: Unknown.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Unknown.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
