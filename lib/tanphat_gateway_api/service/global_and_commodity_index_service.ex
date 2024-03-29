defmodule TanphatGatewayApi.GlobalAndCommodityIndexService do
  alias TanphatGatewayApi.Repo

  def save_global_and_commodity_index(attrs) do
    %GlobalAndCommodityIndex{}
    |> GlobalAndCommodityIndex.changeset(attrs)
    |> Repo.insert()
  end

  def get_all() do
    [hd | _tl] =
      GlobalAndCommodityIndex
      |> Repo.all()

    hd
  end

  def auto_update_index() do
    [
      dji_index_price: get_price(dji_index()),
      dji_index_price_24h_change: get_price_24_change(dji_index()),
      dji_index_rate_24h_change: get_rate_24_change(dji_index()),
      snp500_index_price: get_price(snp500_index()),
      snp500_index_price_24h_change: get_price_24_change(snp500_index()),
      snp500_index_rate_24h_change: get_rate_24_change(snp500_index()),
      nasdaq100_index_price: get_price(nasdaq100_index()),
      nasdaq100_index_price_24h_change: get_price_24_change(nasdaq100_index()),
      nasdaq100_index_rate_24h_change: get_rate_24_change(nasdaq100_index()),
      ftse100_index_price: get_price(ftse100_index()),
      ftse100_index_price_24h_change: get_price_24_change(ftse100_index()),
      ftse100_index_rate_24h_change: get_rate_24_change(ftse100_index()),
      euro50_index_price: get_price(euro50_index()),
      euro50_index_price_24h_change: get_price_24_change(euro50_index()),
      euro50_index_rate_24h_change: get_rate_24_change(euro50_index()),
      nikkei255_index_price: get_price(nikkei255_index()),
      nikkei255_index_price_24h_change: get_price_24_change(nikkei255_index()),
      nikkei255_index_rate_24h_change: get_rate_24_change(nikkei255_index()),
      snp_gsci_gold_price: get_price(snp_gsci_gold()),
      snp_gsci_gold_price_24h_change: get_price_24_change(snp_gsci_gold()),
      snp_gsci_gold_rate_24h_change: get_rate_24_change(snp_gsci_gold()),
      snp_gsci_crude_oil_price: get_price(snp_gsci_crude_oil()),
      snp_gsci_crude_oil_price_24h_change: get_price_24_change(snp_gsci_crude_oil()),
      snp_gsci_crude_oil_rate_24h_change: get_rate_24_change(snp_gsci_crude_oil())
    ]
  end

  def update_global_and_commodity_index() do
    Repo.update_all(GlobalAndCommodityIndex, set: auto_update_index())
  end

  def dji_index do
    {:ok, %HTTPoison.Response{body: body}} =
      HTTPoison.get("https://finance.yahoo.com/quote/%5EDJI/", [],
        timeout: 40_000,
        recv_timeout: 40_000
      )

    crawl_data_from_yahoo(body)
  end

  def snp500_index do
    {:ok, %HTTPoison.Response{body: body}} =
      HTTPoison.get("https://finance.yahoo.com/quote/%5EGSPC?p=^GSPC&.tsrc=fin-srch", [],
        timeout: 40_000,
        recv_timeout: 40_000
      )

    crawl_data_from_yahoo(body)
  end

  def nasdaq100_index do
    {:ok, %HTTPoison.Response{body: body}} =
      HTTPoison.get("https://finance.yahoo.com/quote/%5ENDX?p=^NDX&.tsrc=fin-srch", [],
        timeout: 40_000,
        recv_timeout: 40_000
      )

    crawl_data_from_yahoo(body)
  end

  def ftse100_index do
    {:ok, %HTTPoison.Response{body: body}} =
      HTTPoison.get("https://finance.yahoo.com/quote/%5EFTSE?p=^FTSE&.tsrc=fin-srch", [],
        timeout: 40_000,
        recv_timeout: 40_000
      )

    crawl_data_from_yahoo(body)
  end

  def euro50_index do
    {:ok, %HTTPoison.Response{body: body}} =
      HTTPoison.get("https://finance.yahoo.com/quote/UIV4.F?p=UIV4.F&.tsrc=fin-srch", [],
        timeout: 40_000,
        recv_timeout: 40_000
      )

    crawl_data_from_yahoo(body)
  end

  def nikkei255_index do
    {:ok, %HTTPoison.Response{body: body}} =
      HTTPoison.get("https://finance.yahoo.com/quote/%5EN225?p=^N225&.tsrc=fin-srch", [],
        timeout: 40_000,
        recv_timeout: 40_000
      )

    crawl_data_from_yahoo(body)
  end

  def snp_gsci_gold do
    {:ok, %HTTPoison.Response{body: body}} =
      HTTPoison.get("https://finance.yahoo.com/quote/GC%3DF?p=GC%3DF", [],
        timeout: 40_000,
        recv_timeout: 40_000
      )

    crawl_data_from_yahoo(body)
  end

  def snp_gsci_agri do
    {:ok, %HTTPoison.Response{body: body}} =
      HTTPoison.get("https://finance.yahoo.com/quote/%5ESPGSAGTR?p=^SPGSAGTR&.tsrc=fin-srch", [],
        timeout: 40_000,
        recv_timeout: 40_000
      )

    crawl_data_from_yahoo(body)
  end

  def snp_gsci_gas_per_usd do
    {:ok, %HTTPoison.Response{body: body}} =
      HTTPoison.get("https://finance.yahoo.com/quote/%5ESPGPRGOT?p=^SPGPRGOT&.tsrc=fin-srch", [],
        timeout: 40_000,
        recv_timeout: 40_000
      )

    crawl_data_from_yahoo(body)
  end

  def snp_wci do
    {:ok, %HTTPoison.Response{body: body}} =
      HTTPoison.get("https://finance.yahoo.com/quote/%5ESPWCI?p=^SPWCI&.tsrc=fin-srch", [],
        timeout: 40_000,
        recv_timeout: 40_000
      )

    crawl_data_from_yahoo(body)
  end

  def snp_gsci_tr do
    {:ok, %HTTPoison.Response{body: body}} =
      HTTPoison.get("https://finance.yahoo.com/quote/%5ESPGSCITR?p=^SPGSCITR&.tsrc=fin-srch", [],
        timeout: 40_000,
        recv_timeout: 40_000
      )

    crawl_data_from_yahoo(body)
  end

  def snp_gsci_enhanced_commodity_ind do
    {:ok, %HTTPoison.Response{body: body}} =
      HTTPoison.get("https://finance.yahoo.com/quote/%5ESPGSCIES?p=^SPGSCIES&.tsrc=fin-srch", [],
        timeout: 40_000,
        recv_timeout: 40_000
      )

    crawl_data_from_yahoo(body)
  end

  def dj_commodity_index_tr do
    {:ok, %HTTPoison.Response{body: body}} =
      HTTPoison.get("https://finance.yahoo.com/quote/%5EDJCIT?p=^DJCIT&.tsrc=fin-srch", [],
        timeout: 40_000,
        recv_timeout: 40_000
      )

    crawl_data_from_yahoo(body)
  end

  def snp_gsci_crude_oil do
    {:ok, %HTTPoison.Response{body: body}} =
      HTTPoison.get("https://finance.yahoo.com/quote/CL%3DF?p=CL%3DF", [],
        timeout: 40_000,
        recv_timeout: 40_000
      )

    crawl_data_from_yahoo(body)
  end

  def snp_gsci_light_energy do
    {:ok, %HTTPoison.Response{body: body}} =
      HTTPoison.get("https://finance.yahoo.com/quote/%5ESPGSLE?p=^SPGSLE&.tsrc=fin-srch", [],
        timeout: 40_000,
        recv_timeout: 40_000
      )

    crawl_data_from_yahoo(body)
  end

  def dj_commodity_index do
    {:ok, %HTTPoison.Response{body: body}} =
      HTTPoison.get("https://finance.yahoo.com/quote/%5EDJCI?p=^DJCI&.tsrc=fin-srch", [],
        timeout: 40_000,
        recv_timeout: 40_000
      )

    crawl_data_from_yahoo(body)
  end

  def snp_gsci_industrial_metals do
    {:ok, %HTTPoison.Response{body: body}} =
      HTTPoison.get("https://finance.yahoo.com/quote/%5ESPGSIN?p=^SPGSIN&.tsrc=fin-srch", [],
        timeout: 40_000,
        recv_timeout: 40_000
      )

    crawl_data_from_yahoo(body)
  end

  def snp_gsci_precious_metals do
    {:ok, %HTTPoison.Response{body: body}} =
      HTTPoison.get("https://finance.yahoo.com/quote/%5ESPGSPMP?p=^SPGSPMP&.tsrc=fin-srch", [],
        timeout: 40_000,
        recv_timeout: 40_000
      )

    crawl_data_from_yahoo(body)
  end

  def crawl_data_from_yahoo(body) do
    [_, _, _,data] ++ _ = String.split(body, "data-reactid=\"31\">")
    [index] ++ _ = String.split(data, "</span>")
    [_, _, data] ++ _ = String.split(body, "data-reactid=\"32\">")
    [nevermind] ++ _ = String.split(data, ")</span>")
    [price_change, per] = String.split(nevermind, " (")

    [index, price_change, per]
  end

  def get_price(arr) do
    [hd | _tl] = arr
    hd
  end

  def get_price_24_change(arr) do
    [_hd | tl] = arr
    [hd | _tl] = tl
    hd
  end

  def get_rate_24_change(arr) do
    [_hd | tl] = arr
    [_hd | tl] = tl
    [hd | _tl] = tl
    hd
  end
end
