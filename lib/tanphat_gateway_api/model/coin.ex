defmodule Coin do
  use Ecto.Schema
  import Ecto.Changeset

  @option_key [
    :price
  ]

  @required_key []

  schema "coin" do
    field :price, :float

    timestamps()
  end

  def changeset(%Coin{} = coin, params \\ %{}) do
    coin
    |> cast(params, @option_key ++ @required_key)
    |> validate_required(@required_key)
  end
end
