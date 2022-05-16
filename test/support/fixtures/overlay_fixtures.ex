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

  @doc """
  Generate a screen.
  """
  def screen_fixture(attrs \\ %{}) do
    {:ok, screen} =
      attrs
      |> Enum.into(%{
        html_content: "some html_content",
        name: "some name",
        screen_size: "some screen_size",
        slug: "some slug"
      })
      |> Layar.Overlay.create_screen()

    screen
  end
end
