defmodule TanphatGatewayApi.Repo.Migrations.AlterCoinTable do
  use Ecto.Migration

  def change do
    alter table("coin") do
      remove :price, :integer
      add :price, :float
    end
  end
end
