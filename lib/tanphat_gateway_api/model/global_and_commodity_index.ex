defmodule GlobalAndCommodityIndex do
    use Ecto.Schema
    import Ecto.Changeset
  
    @option_key [
      :dji_index,
      :snp500_index,
      :nasdaq100_index,
      :ftse100_index,
      :euro50_index,
      :nikkei255_index,
      :snp_gsci_gold,
      :snp_gsci_agri,
      :snp_gsci_gas_per_usd,
      :snp_wci,
      :snp_gsci_tr,
      :snp_gsci_enhanced_commodity_ind,
      :dj_commodity_index_tr,
      :snp_gsci_crude_oil,
      :snp_gsci_light_energy,
      :dj_commodity_index,
      :snp_gsci_industrial_metals,
      :snp_gsci_precious_metals
    ]
  
    @required_key []
  
    schema "global_and_commodity_index" do
      field :dji_index, :string
      field :snp500_index, :string
      field :nasdaq100_index, :string
      field :ftse100_index, :string
      field :euro50_index, :string
      field :nikkei255_index, :string
      field :snp_gsci_gold, :string
      field :snp_gsci_agri, :string
      field :snp_gsci_gas_per_usd, :string
      field :snp_wci, :string
      field :snp_gsci_tr, :string
      field :snp_gsci_enhanced_commodity_ind, :string
      field :dj_commodity_index_tr, :string
      field :snp_gsci_crude_oil, :string
      field :snp_gsci_light_energy, :string
      field :dj_commodity_index, :string
      field :snp_gsci_industrial_metals, :string
      field :snp_gsci_precious_metals, :string
  
      timestamps()
    end
  
    def changeset(%GlobalAndCommodityIndex{} = glo_and_com_index, params \\ %{}) do
      glo_and_com_index
      |> cast(params, @option_key ++ @required_key)
      |> validate_required(@required_key)
    end
  end
  