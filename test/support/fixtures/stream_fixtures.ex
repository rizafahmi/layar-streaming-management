defmodule Layar.StreamFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Layar.Stream` context.
  """

  @doc """
  Generate a session.
  """
  def session_fixture(attrs \\ %{}) do
    {:ok, session} =
      attrs
      |> Enum.into(%{
        description: "some description",
        is_active: true,
        live_url: "some live_url",
        subtitle: "some subtitle",
        title: "some title"
      })
      |> Layar.Stream.create_session()

    session
  end
end
