defmodule Layar.Overlay.Screen do
  use Ecto.Schema
  import Ecto.Changeset

  schema "screens" do
    field :html_content, :string
    field :name, :string
    field :screen_size, :string
    field :slug, :string

    belongs_to(:theme, Layar.Overlay.Theme)

    timestamps()
  end

  @doc false
  def changeset(screen, attrs) do
    screen
    |> cast(attrs, [:name, :slug, :html_content, :screen_size, :theme_id])
    |> validate_required([:name, :slug, :html_content, :theme_id])
  end
end
