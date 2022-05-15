defmodule Layar.Repo.Migrations.CreateSessions do
  use Ecto.Migration

  def change do
    create table(:sessions) do
      add :title, :string
      add :subtitle, :string
      add :description, :text
      add :live_url, :string
      add :is_active, :boolean, default: false, null: false

      timestamps()
    end
  end
end
