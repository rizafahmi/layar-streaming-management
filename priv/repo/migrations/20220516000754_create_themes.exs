defmodule Layar.Repo.Migrations.CreateThemes do
  use Ecto.Migration

  def change do
    create table(:themes) do
      add :name, :string
      add :desc, :text
      add :slug, :string
      add :thumbnail, :string

      timestamps()
    end
  end
end
