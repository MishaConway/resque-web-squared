# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config


config :resque,
  host: "redis",
  port: 6379,
  namespace: "resque",
  db: 2


# General application configuration
config :resque_web_potion, []

# Configures the endpoint
config :resque_web_potion, ResqueWebPotionWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "0wvGKDe0HhbdbyXwT5MW1MWjj2AyC6yvI9O4jOEaktKxP9vzypPwFevHEtVCOlt4",
  render_errors: [view: ResqueWebPotionWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: ResqueWebPotion.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
