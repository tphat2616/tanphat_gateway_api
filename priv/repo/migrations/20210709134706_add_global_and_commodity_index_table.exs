defmodule TanphatGatewayApi.Repo.Migrations.AddGlobalAndCommodityIndexTable do
  use Ecto.Migration

  def change do
    create table "global_and_commodity_index" do
      add :dji_index, :string
      add :snp500_index, :string
      add :nasdaq100_index, :string
      add :ftse100_index, :string
      add :euro50_index, :string
      add :nikkei255_index, :string
      add :snp_gsci_gold, :string
      add :snp_gsci_agri, :string
      add :snp_gsci_gas_per_usd, :string
      add :snp_wci, :string
      add :snp_gsci_tr, :string
      add :snp_gsci_enhanced_commodity_ind, :string
      add :dj_commodity_index_tr, :string
      add :snp_gsci_crude_oil, :string
      add :snp_gsci_light_energy, :string
      add :dj_commodity_index, :string
      add :snp_gsci_industrial_metals, :string
      add :snp_gsci_precious_metals, :string
  
      timestamps()
    end
  end
end
