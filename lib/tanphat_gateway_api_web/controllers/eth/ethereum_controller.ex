defmodule TanphatGatewayApiWeb.EthereumController do
  use TanphatGatewayApiWeb, :controller
  alias TanphatGatewayApi.EthereumBurnedService
  alias TanphatGatewayApi.CoinService

  def eth_burned(conn, _) do
    try do
      result =
        Poison.encode!(%{
          "Total burned": EthereumBurnedService.eth_burned()
        })

      conn
      |> put_resp_content_type("application/json")
      |> send_resp(200, result)
    rescue
      _ ->
        conn
        |> put_resp_content_type("application/json")
        |> send_resp(200, "")
    end
  end

  def eth_price(conn, _) do
    try do
      result = Poison.encode!(CoinService.get_all())

      conn
      |> put_resp_content_type("application/json")
      |> send_resp(200, result)
    rescue
      _ ->
        conn
        |> put_resp_content_type("application/json")
        |> send_resp(200, "")
    end
  end
end
