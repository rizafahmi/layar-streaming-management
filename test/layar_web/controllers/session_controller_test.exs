defmodule LayarWeb.SessionControllerTest do
  use LayarWeb.ConnCase

  import Layar.StreamFixtures

  @create_attrs %{description: "some description", is_active: true, live_url: "some live_url", subtitle: "some subtitle", title: "some title"}
  @update_attrs %{description: "some updated description", is_active: false, live_url: "some updated live_url", subtitle: "some updated subtitle", title: "some updated title"}
  @invalid_attrs %{description: nil, is_active: nil, live_url: nil, subtitle: nil, title: nil}

  describe "index" do
    test "lists all sessions", %{conn: conn} do
      conn = get(conn, Routes.session_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Sessions"
    end
  end

  describe "new session" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.session_path(conn, :new))
      assert html_response(conn, 200) =~ "New Session"
    end
  end

  describe "create session" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.session_path(conn, :create), session: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.session_path(conn, :show, id)

      conn = get(conn, Routes.session_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Session"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.session_path(conn, :create), session: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Session"
    end
  end

  describe "edit session" do
    setup [:create_session]

    test "renders form for editing chosen session", %{conn: conn, session: session} do
      conn = get(conn, Routes.session_path(conn, :edit, session))
      assert html_response(conn, 200) =~ "Edit Session"
    end
  end

  describe "update session" do
    setup [:create_session]

    test "redirects when data is valid", %{conn: conn, session: session} do
      conn = put(conn, Routes.session_path(conn, :update, session), session: @update_attrs)
      assert redirected_to(conn) == Routes.session_path(conn, :show, session)

      conn = get(conn, Routes.session_path(conn, :show, session))
      assert html_response(conn, 200) =~ "some updated description"
    end

    test "renders errors when data is invalid", %{conn: conn, session: session} do
      conn = put(conn, Routes.session_path(conn, :update, session), session: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Session"
    end
  end

  describe "delete session" do
    setup [:create_session]

    test "deletes chosen session", %{conn: conn, session: session} do
      conn = delete(conn, Routes.session_path(conn, :delete, session))
      assert redirected_to(conn) == Routes.session_path(conn, :index)

      assert_error_sent 404, fn ->
        get(conn, Routes.session_path(conn, :show, session))
      end
    end
  end

  defp create_session(_) do
    session = session_fixture()
    %{session: session}
  end
end
