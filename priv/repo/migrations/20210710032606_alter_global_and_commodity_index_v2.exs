defmodule TanphatGatewayApi.Repo.Migrations.AlterGlobalAndCommodityIndexV2 do
  use Ecto.Migration

  def change do
    alter table("global_and_commodity_index") do
      remove :dji_index, :string
      remove :snp500_index, :string
      remove :nasdaq100_index, :string
      remove :ftse100_index, :string
      remove :euro50_index, :string
      remove :nikkei255_index, :string
      remove :snp_gsci_gold, :string
      remove :snp_gsci_agri, :string
      remove :snp_gsci_gas_per_usd, :string
      remove :snp_wci, :string
      remove :snp_gsci_tr, :string
      remove :snp_gsci_enhanced_commodity_ind, :string
      remove :dj_commodity_index_tr, :string
      remove :snp_gsci_crude_oil, :string
      remove :snp_gsci_light_energy, :string
      remove :dj_commodity_index, :string
      remove :snp_gsci_industrial_metals, :string
      remove :snp_gsci_precious_metals, :string
      add :dji_index, {:array, :string}
      add :snp500_index, {:array, :string}
      add :nasdaq100_index, {:array, :string}
      add :ftse100_index, {:array, :string}
      add :euro50_index, {:array, :string}
      add :nikkei255_index, {:array, :string}
      add :snp_gsci_gold, {:array, :string}
      add :snp_gsci_agri, {:array, :string}
      add :snp_gsci_gas_per_usd, {:array, :string}
      add :snp_wci, {:array, :string}
      add :snp_gsci_tr, {:array, :string}
      add :snp_gsci_enhanced_commodity_ind, {:array, :string}
      add :dj_commodity_index_tr, {:array, :string}
      add :snp_gsci_crude_oil, {:array, :string}
      add :snp_gsci_light_energy, {:array, :string}
      add :dj_commodity_index, {:array, :string}
      add :snp_gsci_industrial_metals, {:array, :string}
      add :snp_gsci_precious_metals, {:array, :string}
    end
  end
end
