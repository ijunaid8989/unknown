use Mix.Config

# In this file, we keep production configuration that
# you likely want to automate and keep it away from
# your version control system.
#
# You should document the content of this
# file or create a script for recreating it, since it's
# kept out of version control and might be hard to recover
# or recreate for your teammates (or you later on).
config :socialistical, Socialistical.Endpoint,
  secret_key_base: "jRNj66VMrPxaM1X8btJ7wLkwXjJa1aHM0mLG96LJvq7HCnH3hH6r9cEFbDxB4kxc"

# Configure your database
config :socialistical, Socialistical.Repo,
  adapter: Ecto.Adapters.Postgres,
  url: System.get_env("DATABASE_URL"),
  pool_size: String.to_integer(System.get_env("POOL_SIZE") || "10"),
  ssl: true