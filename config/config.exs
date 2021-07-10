# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :tanphat_gateway_api,
  ecto_repos: [TanphatGatewayApi.Repo]

config :tanphat_gateway_api, TanphatGatewayApi.Scheduler,
  debug_logging: false,
  jobs: [
    # Every 5 minutes
    {"*/5 * * * *", {TanphatGatewayApi.GlobalAndCommodityIndexService, :update_global_and_commodity_index, []}}
  ]
  
config :logger,
  backends: [
    {LoggerFileBackend, :info_log},
    {LoggerFileBackend, :debug_log},
    {LoggerFileBackend, :error_log}
  ]

config :logger, :info_log,
  path: Path.expand("debug/info.log"),
  format: "\n$date $time $metadata[$level] $levelpad$message\n",
  level: :info,
  metadata: [:client_ip]

config :logger, :debug_log,
  path: Path.expand("debug/debug.log"),
  format: "\n$date $time $metadata[$level] $levelpad$message\n",
  level: :debug

config :logger, :error_log,
  path: Path.expand("debug/error.log"),
  format: "\n$date $time $metadata[$level] $levelpad$message\n",
  level: :error

# Configures the endpoint
config :tanphat_gateway_api, TanphatGatewayApiWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "4ztGiNF1hzYkA6FMgGgIeXh5X50ouhlK3yPijVGRTvNSppMtZ7QZ5naZJaPKYF6e",
  render_errors: [view: TanphatGatewayApiWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: TanphatGatewayApi.PubSub,
  live_view: [signing_salt: "yzrIGydC"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
