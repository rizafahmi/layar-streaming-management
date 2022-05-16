defmodule LayarWeb.ThemeControllerTest do
  use LayarWeb.ConnCase

  import Layar.OverlayFixtures

  @create_attrs %{desc: "some desc", name: "some name", slug: "some slug", thumbnail: "some thumbnail"}
  @update_attrs %{desc: "some updated desc", name: "some updated name", slug: "some updated slug", thumbnail: "some updated thumbnail"}
  @invalid_attrs %{desc: nil, name: nil, slug: nil, thumbnail: nil}

  describe "index" do
    test "lists all themes", %{conn: conn} do
      conn = get(conn, Routes.theme_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Themes"
    end
  end

  describe "new theme" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.theme_path(conn, :new))
      assert html_response(conn, 200) =~ "New Theme"
    end
  end

  describe "create theme" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.theme_path(conn, :create), theme: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.theme_path(conn, :show, id)

      conn = get(conn, Routes.theme_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Theme"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.theme_path(conn, :create), theme: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Theme"
    end
  end

  describe "edit theme" do
    setup [:create_theme]

    test "renders form for editing chosen theme", %{conn: conn, theme: theme} do
      conn = get(conn, Routes.theme_path(conn, :edit, theme))
      assert html_response(conn, 200) =~ "Edit Theme"
    end
  end

  describe "update theme" do
    setup [:create_theme]

    test "redirects when data is valid", %{conn: conn, theme: theme} do
      conn = put(conn, Routes.theme_path(conn, :update, theme), theme: @update_attrs)
      assert redirected_to(conn) == Routes.theme_path(conn, :show, theme)

      conn = get(conn, Routes.theme_path(conn, :show, theme))
      assert html_response(conn, 200) =~ "some updated desc"
    end

    test "renders errors when data is invalid", %{conn: conn, theme: theme} do
      conn = put(conn, Routes.theme_path(conn, :update, theme), theme: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Theme"
    end
  end

  describe "delete theme" do
    setup [:create_theme]

    test "deletes chosen theme", %{conn: conn, theme: theme} do
      conn = delete(conn, Routes.theme_path(conn, :delete, theme))
      assert redirected_to(conn) == Routes.theme_path(conn, :index)

      assert_error_sent 404, fn ->
        get(conn, Routes.theme_path(conn, :show, theme))
      end
    end
  end

  defp create_theme(_) do
    theme = theme_fixture()
    %{theme: theme}
  end
end
