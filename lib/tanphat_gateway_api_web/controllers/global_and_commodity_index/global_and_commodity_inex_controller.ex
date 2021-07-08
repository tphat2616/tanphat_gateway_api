defmodule TanphatGatewayApiWeb.GlobalAndCommodityIndexController do
  use TanphatGatewayApiWeb, :controller
  require Logger

  def index(conn, _params) do
    render(conn, "index.html")
  end

  def dji_index do
    {:ok, %HTTPoison.Response{body: body}} =
      HTTPoison.get("https://finance.yahoo.com/quote/%5EDJI/")

    crawl_data_from_yahoo(body)
  end

  def snp500_index do
    {:ok, %HTTPoison.Response{body: body}} =
      HTTPoison.get("https://finance.yahoo.com/quote/%5EGSPC?p=^GSPC&.tsrc=fin-srch")

    crawl_data_from_yahoo(body)
  end

  def nasdaq100_index do
    {:ok, %HTTPoison.Response{body: body}} =
      HTTPoison.get("https://finance.yahoo.com/quote/%5ENDX?p=^NDX&.tsrc=fin-srch")

    crawl_data_from_yahoo(body)
  end

  def ftse100_index do
    {:ok, %HTTPoison.Response{body: body}} =
      HTTPoison.get("https://finance.yahoo.com/quote/%5EFTSE?p=^FTSE&.tsrc=fin-srch")

    crawl_data_from_yahoo(body)
  end

  def euro50_index do
    {:ok, %HTTPoison.Response{body: body}} =
      HTTPoison.get("https://finance.yahoo.com/quote/UIV4.F?p=UIV4.F&.tsrc=fin-srch")

    crawl_data_from_yahoo(body)
  end

  def nikkei255_index do
    {:ok, %HTTPoison.Response{body: body}} =
      HTTPoison.get("https://finance.yahoo.com/quote/%5EN225?p=^N225&.tsrc=fin-srch")

    crawl_data_from_yahoo(body)
  end

  def snp_gsci_gold do
    {:ok, %HTTPoison.Response{body: body}} =
      HTTPoison.get("https://finance.yahoo.com/quote/%5ESPGSGC?p=^SPGSGC&.tsrc=fin-srch")

    crawl_data_from_yahoo(body)
  end

  def snp_gsci_agri do
    {:ok, %HTTPoison.Response{body: body}} =
      HTTPoison.get("https://finance.yahoo.com/quote/%5ESPGSAGTR?p=^SPGSAGTR&.tsrc=fin-srch")

    crawl_data_from_yahoo(body)
  end

  def snp_gsci_gas_per_usd do
    {:ok, %HTTPoison.Response{body: body}} =
      HTTPoison.get("https://finance.yahoo.com/quote/%5ESPGPRGOT?p=^SPGPRGOT&.tsrc=fin-srch")

    crawl_data_from_yahoo(body)
  end

  def snp_wci do
    {:ok, %HTTPoison.Response{body: body}} =
      HTTPoison.get("https://finance.yahoo.com/quote/%5ESPWCI?p=^SPWCI&.tsrc=fin-srch")

    crawl_data_from_yahoo(body)
  end

  def snp_gsci_tr do
    {:ok, %HTTPoison.Response{body: body}} =
      HTTPoison.get("https://finance.yahoo.com/quote/%5ESPGSCITR?p=^SPGSCITR&.tsrc=fin-srch")

    crawl_data_from_yahoo(body)
  end

  def snp_gsci_enhanced_commodity_ind do
    {:ok, %HTTPoison.Response{body: body}} =
      HTTPoison.get("https://finance.yahoo.com/quote/%5ESPGSCIES?p=^SPGSCIES&.tsrc=fin-srch")

    crawl_data_from_yahoo(body)
  end

  def dj_commodity_index_tr do
    {:ok, %HTTPoison.Response{body: body}} =
      HTTPoison.get("https://finance.yahoo.com/quote/%5EDJCIT?p=^DJCIT&.tsrc=fin-srch")

    crawl_data_from_yahoo(body)
  end

  def snp_gsci_crude_oil do
    {:ok, %HTTPoison.Response{body: body}} =
      HTTPoison.get("https://finance.yahoo.com/quote/%5ESPGSCL?p=^SPGSCL&.tsrc=fin-srch")

    crawl_data_from_yahoo(body)
  end

  def snp_gsci_light_energy do
    {:ok, %HTTPoison.Response{body: body}} =
      HTTPoison.get("https://finance.yahoo.com/quote/%5ESPGSLE?p=^SPGSLE&.tsrc=fin-srch")

    crawl_data_from_yahoo(body)
  end

  def dj_commodity_index do
    {:ok, %HTTPoison.Response{body: body}} =
      HTTPoison.get("https://finance.yahoo.com/quote/%5EDJCI?p=^DJCI&.tsrc=fin-srch")

    crawl_data_from_yahoo(body)
  end

  def snp_gsci_industrial_metals do
    {:ok, %HTTPoison.Response{body: body}} =
      HTTPoison.get("https://finance.yahoo.com/quote/%5ESPGSIN?p=^SPGSIN&.tsrc=fin-srch")

    crawl_data_from_yahoo(body)
  end

  def snp_gsci_precious_metals do
    {:ok, %HTTPoison.Response{body: body}} =
      HTTPoison.get("https://finance.yahoo.com/quote/%5ESPGSPMP?p=^SPGSPMP&.tsrc=fin-srch")

    crawl_data_from_yahoo(body)
  end

  def glo_and_com_index(conn, _) do
    try do
      result =
        Poison.encode!(%{
          "Globalization Index": %{
            DJIA: dji_index(),
            "S&P 500": snp500_index(),
            "NASDAQ 100": nasdaq100_index(),
            "FTSE 100": ftse100_index(),
            "EURO 50": euro50_index(),
            "Nikkei 255": nikkei255_index()
          },
          "Commodity Index": %{
            "S&P GSCI Gold": snp_gsci_gold(),
            "S&P GSCI Agriculture": snp_gsci_agri(),
            "S&P GSCI Natural Gas US": snp_gsci_gas_per_usd(),
            "S&P WCI": snp_wci(),
            "S&P GSCI TR": snp_gsci_tr(),
            "S&P GSCI Enhanced Commodity": snp_gsci_enhanced_commodity_ind(),
            "Dow Jones Commodity Index TR": dj_commodity_index_tr(),
            "S&P GSCI Crude Oil ER": snp_gsci_crude_oil(),
            "S&P GSCI Light Energy": snp_gsci_light_energy(),
            "Dow Jones Commodity Index": dj_commodity_index(),
            "S&P GSCI Industrial Metals": snp_gsci_industrial_metals(),
            "S&P GSCI Precious Metals": snp_gsci_precious_metals()
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

  def global_index(conn, _) do
    try do
      result =
        Poison.encode!(%{
          DJIA: dji_index(),
          "S&P 500": snp500_index(),
          "NASDAQ 100": nasdaq100_index(),
          "FTSE 100": ftse100_index(),
          "EURO 50": euro50_index(),
          "Nikkei 255": nikkei255_index()
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
          "S&P GSCI Gold": snp_gsci_gold(),
          "S&P GSCI Agriculture": snp_gsci_agri(),
          "S&P GSCI Natural Gas US": snp_gsci_gas_per_usd(),
          "S&P WCI": snp_wci(),
          "S&P GSCI TR": snp_gsci_tr(),
          "S&P GSCI Enhanced Commodity": snp_gsci_enhanced_commodity_ind(),
          "Dow Jones Commodity Index TR": dj_commodity_index_tr(),
          "S&P GSCI Crude Oil ER": snp_gsci_crude_oil(),
          "S&P GSCI Light Energy": snp_gsci_light_energy(),
          "Dow Jones Commodity Index": dj_commodity_index(),
          "S&P GSCI Industrial Metals": snp_gsci_industrial_metals(),
          "S&P GSCI Precious Metals": snp_gsci_precious_metals()
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

  def crawl_data_from_yahoo(body) do
    Logger.info(body)
    [_, _, data] ++ _ = String.split(body, "data-reactid=\"32\">")
    [index] ++ _ = String.split(data, "</span><span")
    [_ | tl] = String.split(index, "data-reactid=\"33\">")
    [hd | _] = tl
    [_, _, _, data] ++ _ = String.split(body, "data-reactid=\"34\">")
    [nevermind] ++ _ = String.split(data, ")</span>")
    [price_change, per] = String.split(nevermind, " (")

    [hd, price_change, per]
  end
end
