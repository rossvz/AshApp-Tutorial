# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :ash_app,
  ecto_repos: [AshApp.Repo]

# Configures the endpoint
config :ash_app, AshAppWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "I1yaT0zYLn0j5SIbLa6zu2twz4Ph85VZyQjzRNWBonScSqHw2FY6ApeguSBryrpc",
  render_errors: [view: AshAppWeb.ErrorView, accepts: ~w(json), layout: false],
  pubsub_server: AshApp.PubSub,
  live_view: [signing_salt: "xvQMwT9K"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

config :mime, :types, %{
  "application/vnd.api_json" => ["json"]
}

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
