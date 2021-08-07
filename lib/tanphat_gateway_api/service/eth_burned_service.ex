defmodule TanphatGatewayApi.EthereumBurnedService do
  @spec eth_burned :: binary
  def eth_burned() do
    {:ok, %HTTPoison.Response{body: body}} = HTTPoison.get("https://ethburned.info/")
    crawl_data_from_ethechain(body)
  end

  @spec crawl_data_from_ethechain(binary) :: any
  def crawl_data_from_ethechain(body) do
    [data, _] = String.split(body, "Total burned")
    [_, data] = String.split(data, "<div class=\"jsx-1957044887 big\">")
    [data, _] = String.split(data, "<!-- --> ETH")
    data
  end
end
