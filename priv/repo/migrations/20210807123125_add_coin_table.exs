defmodule TanphatGatewayApi.Repo.Migrations.AddCoinTable do
  use Ecto.Migration

  def change do
    create table("coin") do
      add :price, :integer

      timestamps()
    end
  end
end
