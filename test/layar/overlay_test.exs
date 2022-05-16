defmodule Layar.OverlayTest do
  use Layar.DataCase

  alias Layar.Overlay

  describe "themes" do
    alias Layar.Overlay.Theme

    import Layar.OverlayFixtures

    @invalid_attrs %{desc: nil, name: nil, slug: nil, thumbnail: nil}

    test "list_themes/0 returns all themes" do
      theme = theme_fixture()
      assert Overlay.list_themes() == [theme]
    end

    test "get_theme!/1 returns the theme with given id" do
      theme = theme_fixture()
      assert Overlay.get_theme!(theme.id) == theme
    end

    test "create_theme/1 with valid data creates a theme" do
      valid_attrs = %{desc: "some desc", name: "some name", slug: "some slug", thumbnail: "some thumbnail"}

      assert {:ok, %Theme{} = theme} = Overlay.create_theme(valid_attrs)
      assert theme.desc == "some desc"
      assert theme.name == "some name"
      assert theme.slug == "some slug"
      assert theme.thumbnail == "some thumbnail"
    end

    test "create_theme/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Overlay.create_theme(@invalid_attrs)
    end

    test "update_theme/2 with valid data updates the theme" do
      theme = theme_fixture()
      update_attrs = %{desc: "some updated desc", name: "some updated name", slug: "some updated slug", thumbnail: "some updated thumbnail"}

      assert {:ok, %Theme{} = theme} = Overlay.update_theme(theme, update_attrs)
      assert theme.desc == "some updated desc"
      assert theme.name == "some updated name"
      assert theme.slug == "some updated slug"
      assert theme.thumbnail == "some updated thumbnail"
    end

    test "update_theme/2 with invalid data returns error changeset" do
      theme = theme_fixture()
      assert {:error, %Ecto.Changeset{}} = Overlay.update_theme(theme, @invalid_attrs)
      assert theme == Overlay.get_theme!(theme.id)
    end

    test "delete_theme/1 deletes the theme" do
      theme = theme_fixture()
      assert {:ok, %Theme{}} = Overlay.delete_theme(theme)
      assert_raise Ecto.NoResultsError, fn -> Overlay.get_theme!(theme.id) end
    end

    test "change_theme/1 returns a theme changeset" do
      theme = theme_fixture()
      assert %Ecto.Changeset{} = Overlay.change_theme(theme)
    end
  end
end
