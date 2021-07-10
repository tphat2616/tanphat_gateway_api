defmodule TanphatGatewayApiWeb.GlobalAndCommodityIndexController do
  use TanphatGatewayApiWeb, :controller
  alias TanphatGatewayApi.GlobalAndCommodityIndexService, as: Index
  def index(conn, _params) do
    render(conn, "index.html")
  end
  def glo_and_com_index(conn, _) do
    try do
      result =
        Poison.encode!(%{
          "Globalization Index": %{
            "DJIA": Index.dji_index(),
            "S&P 500": Index.snp500_index(),
            "NASDAQ 100": Index.nasdaq100_index(),
            "FTSE 100": Index.ftse100_index(),
            "EURO 50": Index.euro50_index(),
            "Nikkei 255": Index.nikkei255_index()
          },
          "Commodity Index": %{
            "S&P GSCI Gold": Index.snp_gsci_gold(),
            "S&P GSCI Agriculture": Index.snp_gsci_agri(),
            "S&P GSCI Natural Gas US": Index.snp_gsci_gas_per_usd(),
            "S&P WCI": Index.snp_wci(),
            "S&P GSCI TR": Index.snp_gsci_tr(),
            "S&P GSCI Enhanced Commodity": Index.snp_gsci_enhanced_commodity_ind(),
            "Dow Jones Commodity Index TR": Index.dj_commodity_index_tr(),
            "S&P GSCI Crude Oil ER": Index.snp_gsci_crude_oil(),
            "S&P GSCI Light Energy": Index.snp_gsci_light_energy(),
            "Dow Jones Commodity Index": Index.dj_commodity_index(),
            "S&P GSCI Industrial Metals": Index.snp_gsci_industrial_metals(),
            "S&P GSCI Precious Metals": Index.snp_gsci_precious_metals()
          }
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

  def index_stat(conn, _) do
    try do
      result = Poison.encode!(Index.get_all())
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

  def global_index(conn, _) do
    try do
      result =
        Poison.encode!(%{
          "DJIA": Index.dji_index(),
          "S&P 500": Index.snp500_index(),
          "NASDAQ 100": Index.nasdaq100_index(),
          "FTSE 100": Index.ftse100_index(),
          "EURO 50": Index.euro50_index(),
          "Nikkei 255": Index.nikkei255_index()
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

  def commodity_index(conn, _) do
    try do
      result =
        Poison.encode!(%{
          "S&P GSCI Gold": Index.snp_gsci_gold(),
          "S&P GSCI Agriculture": Index.snp_gsci_agri(),
          "S&P GSCI Natural Gas US": Index.snp_gsci_gas_per_usd(),
          "S&P WCI": Index.snp_wci(),
          "S&P GSCI TR": Index.snp_gsci_tr(),
          "S&P GSCI Enhanced Commodity": Index.snp_gsci_enhanced_commodity_ind(),
          "Dow Jones Commodity Index TR": Index.dj_commodity_index_tr(),
          "S&P GSCI Crude Oil ER": Index.snp_gsci_crude_oil(),
          "S&P GSCI Light Energy": Index.snp_gsci_light_energy(),
          "Dow Jones Commodity Index": Index.dj_commodity_index(),
          "S&P GSCI Industrial Metals": Index.snp_gsci_industrial_metals(),
          "S&P GSCI Precious Metals": Index.snp_gsci_precious_metals()
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
end
