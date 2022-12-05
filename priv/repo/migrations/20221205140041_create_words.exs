defmodule GlosaryApi.Repo.Migrations.CreateWords do
  use Ecto.Migration

  def change do
    create table(:words) do
      add :name, :string
      add :description, :string
      #add :category, :integer

      timestamps()
    end

    create unique_index(:words, [:name])
  end
end
