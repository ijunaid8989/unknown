# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :socialistical,
  ecto_repos: [Socialistical.Repo]

# Configures the endpoint
config :socialistical, Socialistical.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "n5dBpdkR4N/h8mSE2+dBHtgB0+TuKeBP54l2pLLIur3PQP5+A8e4cPq8SjED6++S",
  render_errors: [view: Socialistical.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Socialistical.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
