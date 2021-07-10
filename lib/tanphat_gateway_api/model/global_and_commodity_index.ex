defmodule GlobalAndCommodityIndex do
    use Ecto.Schema
    import Ecto.Changeset
  
    @option_key [
      :dji_index_price,
      :dji_index_price_24h_change,
      :dji_index_rate_24h_change,
      :snp500_index_price,
      :snp500_index_price_24h_change,
      :snp500_index_rate_24h_change,
      :nasdaq100_index_price,
      :nasdaq100_index_price_24h_change,
      :nasdaq100_index_rate_24h_change,
      :ftse100_index_price,
      :ftse100_index_price_24h_change,
      :ftse100_index_rate_24h_change,
      :euro50_index_price,
      :euro50_index_price_24h_change,
      :euro50_index_rate_24h_change,
      :nikkei255_index_price,
      :nikkei255_index_price_24h_change,
      :nikkei255_index_rate_24h_change,
      :snp_gsci_gold_price,
      :snp_gsci_gold_price_24h_change,
      :snp_gsci_gold_rate_24h_change,
      :snp_gsci_agri_price,
      :snp_gsci_agri_price_24h_change,
      :snp_gsci_agri_rate_24h_change,
      :snp_gsci_gas_per_price,
      :snp_gsci_gas_per_price_24h_change,
      :snp_gsci_gas_per_rate_24h_change,
      :snp_wci_price,
      :snp_wci_price_24h_change,
      :snp_wci_rate_24h_change,
      :snp_gsci_tr_price,
      :snp_gsci_tr_price_24h_change,
      :snp_gsci_tr_rate_24h_change,
      :snp_gsci_enhanced_commodity_ind_price,
      :snp_gsci_enhanced_commodity_ind_price_24h_change,
      :snp_gsci_enhanced_commodity_ind_rate_24h_change,
      :dj_commodity_index_tr_price,
      :dj_commodity_index_tr_price_24h_change,
      :dj_commodity_index_tr_rate_24h_change,
      :snp_gsci_crude_oil_price,
      :snp_gsci_crude_oil_price_24h_change,
      :snp_gsci_crude_oil_rate_24h_change,
      :snp_gsci_light_energy_price,
      :snp_gsci_light_energy_price_24h_change,
      :snp_gsci_light_energy_rate_24h_change,
      :dj_commodity_index_price,
      :dj_commodity_index_price_24h_change,
      :dj_commodity_index_rate_24h_change,
      :snp_gsci_industrial_metals_price,
      :snp_gsci_industrial_metals_price_24h_change,
      :snp_gsci_industrial_metals_rate_24h_change,
      :snp_gsci_precious_metals_price,
      :snp_gsci_precious_metals_price_24h_change,
      :snp_gsci_precious_metals_rate_24h_change
    ]
  
    @required_key []
  
    schema "global_and_commodity_index" do
      field :dji_index_price, :string
      field :dji_index_price_24h_change, :string
      field :dji_index_rate_24h_change, :string
      field :snp500_index_price, :string
      field :snp500_index_price_24h_change, :string
      field :snp500_index_rate_24h_change, :string
      field :nasdaq100_index_price, :string
      field :nasdaq100_index_price_24h_change, :string
      field :nasdaq100_index_rate_24h_change, :string
      field :ftse100_index_price, :string
      field :ftse100_index_price_24h_change, :string
      field :ftse100_index_rate_24h_change, :string
      field :euro50_index_price, :string
      field :euro50_index_price_24h_change, :string
      field :euro50_index_rate_24h_change, :string
      field :nikkei255_index_price, :string
      field :nikkei255_index_price_24h_change, :string
      field :nikkei255_index_rate_24h_change, :string
      field :snp_gsci_gold_price, :string
      field :snp_gsci_gold_price_24h_change, :string
      field :snp_gsci_gold_rate_24h_change, :string
      field :snp_gsci_agri_price, :string
      field :snp_gsci_agri_price_24h_change, :string
      field :snp_gsci_agri_rate_24h_change, :string
      field :snp_gsci_gas_per_price, :string
      field :snp_gsci_gas_per_price_24h_change, :string
      field :snp_gsci_gas_per_rate_24h_change, :string
      field :snp_wci_price, :string
      field :snp_wci_price_24h_change, :string
      field :snp_wci_rate_24h_change, :string
      field :snp_gsci_tr_price, :string
      field :snp_gsci_tr_price_24h_change, :string
      field :snp_gsci_tr_rate_24h_change, :string
      field :snp_gsci_enhanced_commodity_ind_price, :string
      field :snp_gsci_enhanced_commodity_ind_price_24h_change, :string
      field :snp_gsci_enhanced_commodity_ind_rate_24h_change, :string
      field :dj_commodity_index_tr_price, :string
      field :dj_commodity_index_tr_price_24h_change, :string
      field :dj_commodity_index_tr_rate_24h_change, :string
      field :snp_gsci_crude_oil_price, :string
      field :snp_gsci_crude_oil_price_24h_change, :string
      field :snp_gsci_crude_oil_rate_24h_change, :string
      field :snp_gsci_light_energy_price, :string
      field :snp_gsci_light_energy_price_24h_change, :string
      field :snp_gsci_light_energy_rate_24h_change, :string
      field :dj_commodity_index_price, :string
      field :dj_commodity_index_price_24h_change, :string
      field :dj_commodity_index_rate_24h_change, :string
      field :snp_gsci_industrial_metals_price, :string
      field :snp_gsci_industrial_metals_price_24h_change, :string
      field :snp_gsci_industrial_metals_rate_24h_change, :string
      field :snp_gsci_precious_metals_price, :string
      field :snp_gsci_precious_metals_price_24h_change, :string
      field :snp_gsci_precious_metals_rate_24h_change, :string
  
      timestamps()
    end
  
    def changeset(%GlobalAndCommodityIndex{} = glo_and_com_index, params \\ %{}) do
      glo_and_com_index
      |> cast(params, @option_key ++ @required_key)
      |> validate_required(@required_key)
    end
  end
  