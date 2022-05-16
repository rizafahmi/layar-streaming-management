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

  describe "screens" do
    alias Layar.Overlay.Screen

    import Layar.OverlayFixtures

    @invalid_attrs %{html_content: nil, name: nil, screen_size: nil, slug: nil}

    test "list_screens/0 returns all screens" do
      screen = screen_fixture()
      assert Overlay.list_screens() == [screen]
    end

    test "get_screen!/1 returns the screen with given id" do
      screen = screen_fixture()
      assert Overlay.get_screen!(screen.id) == screen
    end

    test "create_screen/1 with valid data creates a screen" do
      valid_attrs = %{html_content: "some html_content", name: "some name", screen_size: "some screen_size", slug: "some slug"}

      assert {:ok, %Screen{} = screen} = Overlay.create_screen(valid_attrs)
      assert screen.html_content == "some html_content"
      assert screen.name == "some name"
      assert screen.screen_size == "some screen_size"
      assert screen.slug == "some slug"
    end

    test "create_screen/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Overlay.create_screen(@invalid_attrs)
    end

    test "update_screen/2 with valid data updates the screen" do
      screen = screen_fixture()
      update_attrs = %{html_content: "some updated html_content", name: "some updated name", screen_size: "some updated screen_size", slug: "some updated slug"}

      assert {:ok, %Screen{} = screen} = Overlay.update_screen(screen, update_attrs)
      assert screen.html_content == "some updated html_content"
      assert screen.name == "some updated name"
      assert screen.screen_size == "some updated screen_size"
      assert screen.slug == "some updated slug"
    end

    test "update_screen/2 with invalid data returns error changeset" do
      screen = screen_fixture()
      assert {:error, %Ecto.Changeset{}} = Overlay.update_screen(screen, @invalid_attrs)
      assert screen == Overlay.get_screen!(screen.id)
    end

    test "delete_screen/1 deletes the screen" do
      screen = screen_fixture()
      assert {:ok, %Screen{}} = Overlay.delete_screen(screen)
      assert_raise Ecto.NoResultsError, fn -> Overlay.get_screen!(screen.id) end
    end

    test "change_screen/1 returns a screen changeset" do
      screen = screen_fixture()
      assert %Ecto.Changeset{} = Overlay.change_screen(screen)
    end
  end
end
