defmodule LayarWeb.ScreenControllerTest do
  use LayarWeb.ConnCase

  import Layar.OverlayFixtures

  @create_attrs %{html_content: "some html_content", name: "some name", screen_size: "some screen_size", slug: "some slug"}
  @update_attrs %{html_content: "some updated html_content", name: "some updated name", screen_size: "some updated screen_size", slug: "some updated slug"}
  @invalid_attrs %{html_content: nil, name: nil, screen_size: nil, slug: nil}

  describe "index" do
    test "lists all screens", %{conn: conn} do
      conn = get(conn, Routes.screen_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Screens"
    end
  end

  describe "new screen" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.screen_path(conn, :new))
      assert html_response(conn, 200) =~ "New Screen"
    end
  end

  describe "create screen" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.screen_path(conn, :create), screen: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.screen_path(conn, :show, id)

      conn = get(conn, Routes.screen_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Screen"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.screen_path(conn, :create), screen: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Screen"
    end
  end

  describe "edit screen" do
    setup [:create_screen]

    test "renders form for editing chosen screen", %{conn: conn, screen: screen} do
      conn = get(conn, Routes.screen_path(conn, :edit, screen))
      assert html_response(conn, 200) =~ "Edit Screen"
    end
  end

  describe "update screen" do
    setup [:create_screen]

    test "redirects when data is valid", %{conn: conn, screen: screen} do
      conn = put(conn, Routes.screen_path(conn, :update, screen), screen: @update_attrs)
      assert redirected_to(conn) == Routes.screen_path(conn, :show, screen)

      conn = get(conn, Routes.screen_path(conn, :show, screen))
      assert html_response(conn, 200) =~ "some updated html_content"
    end

    test "renders errors when data is invalid", %{conn: conn, screen: screen} do
      conn = put(conn, Routes.screen_path(conn, :update, screen), screen: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Screen"
    end
  end

  describe "delete screen" do
    setup [:create_screen]

    test "deletes chosen screen", %{conn: conn, screen: screen} do
      conn = delete(conn, Routes.screen_path(conn, :delete, screen))
      assert redirected_to(conn) == Routes.screen_path(conn, :index)

      assert_error_sent 404, fn ->
        get(conn, Routes.screen_path(conn, :show, screen))
      end
    end
  end

  defp create_screen(_) do
    screen = screen_fixture()
    %{screen: screen}
  end
end
