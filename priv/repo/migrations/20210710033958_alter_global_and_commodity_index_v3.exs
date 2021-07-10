defmodule TanphatGatewayApi.Repo.Migrations.AlterGlobalAndCommodityIndexV3 do
  use Ecto.Migration

  def change do
    alter table "global_and_commodity_index" do
      remove :dji_index, {:array, :string}
      remove :snp500_index, {:array, :string}
      remove :nasdaq100_index, {:array, :string}
      remove :ftse100_index, {:array, :string}
      remove :euro50_index, {:array, :string}
      remove :nikkei255_index, {:array, :string}
      remove :snp_gsci_gold, {:array, :string}
      remove :snp_gsci_agri, {:array, :string}
      remove :snp_gsci_gas_per_usd, {:array, :string}
      remove :snp_wci, {:array, :string}
      remove :snp_gsci_tr, {:array, :string}
      remove :snp_gsci_enhanced_commodity_ind, {:array, :string}
      remove :dj_commodity_index_tr, {:array, :string}
      remove :snp_gsci_crude_oil, {:array, :string}
      remove :snp_gsci_light_energy, {:array, :string}
      remove :dj_commodity_index, {:array, :string}
      remove :snp_gsci_industrial_metals, {:array, :string}
      remove :snp_gsci_precious_metals, {:array, :string}
      add :dji_index_price, :string
      add :dji_index_price_24h_change, :string
      add :dji_index_rate_24h_change, :string
      add :snp500_index_price, :string
      add :snp500_index_price_24h_change, :string
      add :snp500_index_rate_24h_change, :string
      add :nasdaq100_index_price, :string
      add :nasdaq100_index_price_24h_change, :string
      add :nasdaq100_index_rate_24h_change, :string
      add :ftse100_index_price, :string
      add :ftse100_index_price_24h_change, :string
      add :ftse100_index_rate_24h_change, :string
      add :euro50_index_price, :string
      add :euro50_index_price_24h_change, :string
      add :euro50_index_rate_24h_change, :string
      add :nikkei255_index_price, :string
      add :nikkei255_index_price_24h_change, :string
      add :nikkei255_index_rate_24h_change, :string
      add :snp_gsci_gold_price, :string
      add :snp_gsci_gold_price_24h_change, :string
      add :snp_gsci_gold_rate_24h_change, :string
      add :snp_gsci_agri_price, :string
      add :snp_gsci_agri_price_24h_change, :string
      add :snp_gsci_agri_rate_24h_change, :string
      add :snp_gsci_gas_per_price, :string
      add :snp_gsci_gas_per_price_24h_change, :string
      add :snp_gsci_gas_per_rate_24h_change, :string
      add :snp_wci_price, :string
      add :snp_wci_price_24h_change, :string
      add :snp_wci_rate_24h_change, :string
      add :snp_gsci_tr_price, :string
      add :snp_gsci_tr_price_24h_change, :string
      add :snp_gsci_tr_rate_24h_change, :string
      add :snp_gsci_enhanced_commodity_ind_price, :string
      add :snp_gsci_enhanced_commodity_ind_price_24h_change, :string
      add :snp_gsci_enhanced_commodity_ind_rate_24h_change, :string
      add :dj_commodity_index_tr_price, :string
      add :dj_commodity_index_tr_price_24h_change, :string
      add :dj_commodity_index_tr_rate_24h_change, :string
      add :snp_gsci_crude_oil_price, :string
      add :snp_gsci_crude_oil_price_24h_change, :string
      add :snp_gsci_crude_oil_rate_24h_change, :string
      add :snp_gsci_light_energy_price, :string
      add :snp_gsci_light_energy_price_24h_change, :string
      add :snp_gsci_light_energy_rate_24h_change, :string
      add :dj_commodity_index_price, :string
      add :dj_commodity_index_price_24h_change, :string
      add :dj_commodity_index_rate_24h_change, :string
      add :snp_gsci_industrial_metals_price, :string
      add :snp_gsci_industrial_metals_price_24h_change, :string
      add :snp_gsci_industrial_metals_rate_24h_change, :string
      add :snp_gsci_precious_metals_price, :string
      add :snp_gsci_precious_metals_price_24h_change, :string
      add :snp_gsci_precious_metals_rate_24h_change, :string
    end
  end
end
