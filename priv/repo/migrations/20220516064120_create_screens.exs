defmodule Layar.Repo.Migrations.CreateScreens do
  use Ecto.Migration

  def change do
    create table(:screens) do
      add :name, :string
      add :slug, :string
      add :html_content, :text
      add :screen_size, :string, default: "1280x720"
      add :theme_id, references(:themes, on_delete: :delete_all)

      timestamps()
    end

    create index(:screens, [:theme_id])
  end
end
