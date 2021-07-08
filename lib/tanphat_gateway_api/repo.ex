defmodule TanphatGatewayApi.Repo do
  use Ecto.Repo,
    otp_app: :tanphat_gateway_api,
    adapter: Ecto.Adapters.Postgres
end
