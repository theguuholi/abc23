# This file is responsible for configuring your application
# and its dependencies with the aid of the Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
import Config

config :picking_and_delivery,
  ecto_repos: [PickingAndDelivery.Repo],
  generators: [binary_id: true]

# Configures the endpoint
config :picking_and_delivery, PickingAndDeliveryWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "bwDH/l/Wt+YM5x5+oYjFsuFYUq1g5Q1/+wOT7Nyj6wZv0ARhNDvJeVyapa2VkLOL",
  render_errors: [view: PickingAndDeliveryWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: PickingAndDelivery.PubSub,
  live_view: [signing_salt: "Vl+pefw2"]

# Configures the mailer
#
# By default it uses the "Local" adapter which stores the emails
# locally. You can see the emails in your browser, at "/dev/mailbox".
#
# For production it's recommended to configure a different adapter
# at the `config/runtime.exs`.
config :picking_and_delivery, PickingAndDelivery.Mailer, adapter: Swoosh.Adapters.Local

# Swoosh API client is needed for adapters other than SMTP.
config :swoosh, :api_client, false

# Configure esbuild (the version is required)
config :esbuild,
  version: "0.12.18",
  default: [
    args: ~w(js/app.js --bundle --target=es2016 --outdir=../priv/static/assets),
    cd: Path.expand("../assets", __DIR__),
    env: %{"NODE_PATH" => Path.expand("../deps", __DIR__)}
  ]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "mongo.exs"
import_config "#{config_env()}.exs"
