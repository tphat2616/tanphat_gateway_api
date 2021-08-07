defmodule TanphatGatewayApi.CoinService do
  alias TanphatGatewayApi.Repo

  def save_coin(attrs) do
    %Coin{}
    |> Coin.changeset(attrs)
    |> Repo.insert()
  end

  def auto_update_coin() do
    [
      price: get_eth_price(get_eth_info())
    ]
  end

  def update_coin() do
    Repo.update_all(Coin, set: auto_update_coin())
  end

  def get_eth_price(eth) do
    case %{
           "status" => %{"error_code" => 0},
           "data" => [%{"quote" => %{"USD" => %{"price" => price}}}]
         } = eth do
      eth ->
        price

      _ ->
        nil
    end
  end

  def get_eth_info do
    {:ok, %HTTPoison.Response{body: body}} =
      HTTPoison.get(
        "https://pro-api.coinmarketcap.com/v1/cryptocurrency/listings/latest?start=2&limit=1&convert=USD",
        [{"X-CMC_PRO_API_KEY", "d07f0be4-bd60-4721-be09-249f0227bb16"}]
      )

    Poison.decode!(body)
  end
end
