defmodule TanphatGatewayApi.GlobalAndCommodityIndexService do
  alias TanphatGatewayApi.Repo

  def save_global_and_commodity_index(attrs) do
    %GlobalAndCommodityIndex{}
    |> GlobalAndCommodityIndex.changeset(attrs)
    |> Repo.insert()
  end

  def get_all() do
    [hd | tl] = GlobalAndCommodityIndex
    |> Repo.all()
    hd
  end

  def auto_save_index() do
    index = %{
      dji_index: dji_index(),
      snp500_index: snp500_index(),
      nasdaq100_index: nasdaq100_index(),
      ftse100_index: ftse100_index(),
      euro50_index: euro50_index(),
      nikkei255_index: nikkei255_index(),
      snp_gsci_gold: snp_gsci_gold(),
      snp_gsci_agri: snp_gsci_agri(),
      snp_gsci_gas_per_usd: snp_gsci_gas_per_usd(),
      snp_wci: snp_wci(),
      snp_gsci_tr: snp_gsci_tr(),
      snp_gsci_enhanced_commodity_ind: snp_gsci_enhanced_commodity_ind(),
      dj_commodity_index_tr: dj_commodity_index_tr(),
      snp_gsci_crude_oil: snp_gsci_crude_oil(),
      snp_gsci_light_energy: snp_gsci_light_energy(),
      dj_commodity_index: dj_commodity_index(),
      snp_gsci_industrial_metals: snp_gsci_industrial_metals(),
      snp_gsci_precious_metals: snp_gsci_precious_metals()
    }
    save_global_and_commodity_index(index)
  end

  def auto_update_index() do
    [
      dji_index: dji_index(),
      snp500_index: snp500_index(),
      nasdaq100_index: nasdaq100_index(),
      ftse100_index: ftse100_index(),
      euro50_index: euro50_index(),
      nikkei255_index: nikkei255_index(),
      snp_gsci_gold: snp_gsci_gold(),
      snp_gsci_agri: snp_gsci_agri(),
      snp_gsci_gas_per_usd: snp_gsci_gas_per_usd(),
      snp_wci: snp_wci(),
      snp_gsci_tr: snp_gsci_tr(),
      snp_gsci_enhanced_commodity_ind: snp_gsci_enhanced_commodity_ind(),
      dj_commodity_index_tr: dj_commodity_index_tr(),
      snp_gsci_crude_oil: snp_gsci_crude_oil(),
      snp_gsci_light_energy: snp_gsci_light_energy(),
      dj_commodity_index: dj_commodity_index(),
      snp_gsci_industrial_metals: snp_gsci_industrial_metals(),
      snp_gsci_precious_metals: snp_gsci_precious_metals()
    ]
  end

  def update_global_and_commodity_index() do
    Repo.update_all(GlobalAndCommodityIndex, set: auto_update_index())
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

  def crawl_data_from_yahoo(body) do
    [_, _, data] ++ _ = String.split(body, "data-reactid=\"32\">")
    [index] ++ _ = String.split(data, "</span><span")
    [_, _, _, data] ++ _ = String.split(body, "data-reactid=\"33\">")
    [nevermind] ++ _ = String.split(data, ")</span>")
    [price_change, per] = String.split(nevermind, " (")

    [index, price_change, per]
  end
end
  