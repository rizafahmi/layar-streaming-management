defmodule Layar.StreamTest do
  use Layar.DataCase

  alias Layar.Stream

  describe "sessions" do
    alias Layar.Stream.Session

    import Layar.StreamFixtures

    @invalid_attrs %{description: nil, is_active: nil, live_url: nil, subtitle: nil, title: nil}

    test "list_sessions/0 returns all sessions" do
      session = session_fixture()
      assert Stream.list_sessions() == [session]
    end

    test "get_session!/1 returns the session with given id" do
      session = session_fixture()
      assert Stream.get_session!(session.id) == session
    end

    test "create_session/1 with valid data creates a session" do
      valid_attrs = %{description: "some description", is_active: true, live_url: "some live_url", subtitle: "some subtitle", title: "some title"}

      assert {:ok, %Session{} = session} = Stream.create_session(valid_attrs)
      assert session.description == "some description"
      assert session.is_active == true
      assert session.live_url == "some live_url"
      assert session.subtitle == "some subtitle"
      assert session.title == "some title"
    end

    test "create_session/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Stream.create_session(@invalid_attrs)
    end

    test "update_session/2 with valid data updates the session" do
      session = session_fixture()
      update_attrs = %{description: "some updated description", is_active: false, live_url: "some updated live_url", subtitle: "some updated subtitle", title: "some updated title"}

      assert {:ok, %Session{} = session} = Stream.update_session(session, update_attrs)
      assert session.description == "some updated description"
      assert session.is_active == false
      assert session.live_url == "some updated live_url"
      assert session.subtitle == "some updated subtitle"
      assert session.title == "some updated title"
    end

    test "update_session/2 with invalid data returns error changeset" do
      session = session_fixture()
      assert {:error, %Ecto.Changeset{}} = Stream.update_session(session, @invalid_attrs)
      assert session == Stream.get_session!(session.id)
    end

    test "delete_session/1 deletes the session" do
      session = session_fixture()
      assert {:ok, %Session{}} = Stream.delete_session(session)
      assert_raise Ecto.NoResultsError, fn -> Stream.get_session!(session.id) end
    end

    test "change_session/1 returns a session changeset" do
      session = session_fixture()
      assert %Ecto.Changeset{} = Stream.change_session(session)
    end
  end
end
