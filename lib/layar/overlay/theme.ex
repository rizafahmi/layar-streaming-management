defmodule Layar.Overlay.Theme do
  use Ecto.Schema
  import Ecto.Changeset

  schema "themes" do
    field :desc, :string
    field :name, :string
    field :slug, :string
    field :thumbnail, :string

    has_many(:screens, Layar.Overlay.Screen)

    timestamps()
  end

  @doc false
  def changeset(theme, attrs) do
    theme
    |> cast(attrs, [:name, :desc, :slug, :thumbnail])
    |> validate_required([:name, :slug])
    |> unique_constraint(:slug)
  end
end
