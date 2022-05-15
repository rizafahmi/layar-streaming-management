defmodule Layar.Stream.Session do
  use Ecto.Schema
  import Ecto.Changeset

  schema "sessions" do
    field :description, :string
    field :is_active, :boolean, default: false
    field :live_url, :string
    field :subtitle, :string
    field :title, :string

    timestamps()
  end

  @doc false
  def changeset(session, attrs) do
    session
    |> cast(attrs, [:title, :subtitle, :description, :live_url, :is_active])
    |> validate_required([:title, :subtitle, :description, :live_url, :is_active])
  end
end
