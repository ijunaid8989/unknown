# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :unknowns,
  ecto_repos: [Unknowns.Repo]

# Configures the endpoint
config :unknowns, Unknowns.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "knM6h/nyKj41RQESJsNej6bhMaerjFmQK6kcoPEsxpsg3lSq/QgbM77dwoXZ9mk9",
  render_errors: [view: Unknowns.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Unknowns.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
