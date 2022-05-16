defmodule Layar.OverlayFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Layar.Overlay` context.
  """

  @doc """
  Generate a theme.
  """
  def theme_fixture(attrs \\ %{}) do
    {:ok, theme} =
      attrs
      |> Enum.into(%{
        desc: "some desc",
        name: "some name",
        slug: "some slug",
        thumbnail: "some thumbnail"
      })
      |> Layar.Overlay.create_theme()

    theme
  end
end
