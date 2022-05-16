defmodule LayarWeb.SessionController do
  use LayarWeb, :controller

  alias Layar.Stream
  alias Layar.Stream.Session

  def index(conn, _params) do
    sessions = Stream.list_sessions()
    render(conn, "index.html", sessions: sessions)
  end

  def new(conn, _params) do
    changeset = Stream.change_session(%Session{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"session" => session_params}) do
    case Stream.create_session(session_params) do
      {:ok, session} ->
        conn
        |> put_flash(:info, "Session created successfully.")
        |> redirect(to: Routes.session_path(conn, :show, session))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    session = Stream.get_session!(id)
    render(conn, "show.html", session: session)
  end

  def edit(conn, %{"id" => id}) do
    session = Stream.get_session!(id)
    changeset = Stream.change_session(session)
    render(conn, "edit.html", session: session, changeset: changeset)
  end

  def update(conn, %{"id" => id, "session" => session_params}) do
    session = Stream.get_session!(id)

    case Stream.update_session(session, session_params) do
      {:ok, session} ->
        conn
        |> put_flash(:info, "Session updated successfully.")
        |> redirect(to: Routes.session_path(conn, :show, session))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", session: session, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    session = Stream.get_session!(id)
    {:ok, _session} = Stream.delete_session(session)

    conn
    |> put_flash(:info, "Session deleted successfully.")
    |> redirect(to: Routes.session_path(conn, :index))
  end

  def activate(conn, %{"id" => id}) do
    session = Stream.get_session!(id)
    IO.inspect(session)
    Stream.deactivate_all_sessions!()

    case Stream.update_session(session, %{"is_active" => true}) do
      {:ok, _session} ->
        # other_session = Stream.get_session!()

        conn
        |> put_flash(:info, "Session activated successfully.")
        |> redirect(to: Routes.session_path(conn, :index))

      {:error, %Ecto.Changeset{} = _changeset} ->
        conn
        |> put_flash(:info, "Session not activated.")
        |> redirect(to: Routes.session_path(conn, :index))
    end

    conn
    |> put_flash(:info, "Session activated successfully.")
    |> redirect(to: Routes.session_path(conn, :index))

    # case Stream.update_session(session, session_params) do
    #   {:ok, session} ->
    #     conn
    #     |> put_flash(:info, "Session activated successfully.")
    #     |> redirect(to: Routes.session_path(conn, :show, session))

    #   {:error, %Ecto.Changeset{} = changeset} ->
    #     render(conn, "edit.html", session: session, changeset: changeset)
    # end
  end
end
