defmodule LayarWeb.ScreenController do
  use LayarWeb, :controller

  alias Layar.Overlay
  alias Layar.Overlay.{Screen, Theme}
  alias Layar.Repo
  import Ecto.Query

  def index(conn, _params) do
    screens = Overlay.list_screens() |> Repo.preload([:theme])

    render(conn, "index.html", screens: screens)
  end

  def new(conn, _params) do
    query = from(t in Theme, select: {t.name, t.id})
    themes = Repo.all(query)

    changeset = Overlay.change_screen(%Screen{})
    render(conn, "new.html", changeset: changeset, themes: themes)
  end

  def create(conn, %{"screen" => screen_params}) do
    case Overlay.create_screen(screen_params) do
      {:ok, screen} ->
        conn
        |> put_flash(:info, "Screen created successfully.")
        |> redirect(to: Routes.screen_path(conn, :show, screen))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    screen = Overlay.get_screen!(id) |> Repo.preload([:theme])
    render(conn, "show.html", screen: screen)
  end

  def edit(conn, %{"id" => id}) do
    screen = Overlay.get_screen!(id)
    changeset = Overlay.change_screen(screen)

    query = from(t in Theme, select: {t.name, t.id})
    themes = Repo.all(query)
    render(conn, "edit.html", screen: screen, changeset: changeset, themes: themes)
  end

  def update(conn, %{"id" => id, "screen" => screen_params}) do
    screen = Overlay.get_screen!(id)

    case Overlay.update_screen(screen, screen_params) do
      {:ok, screen} ->
        conn
        |> put_flash(:info, "Screen updated successfully.")
        |> redirect(to: Routes.screen_path(conn, :show, screen))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", screen: screen, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    screen = Overlay.get_screen!(id)
    {:ok, _screen} = Overlay.delete_screen(screen)

    conn
    |> put_flash(:info, "Screen deleted successfully.")
    |> redirect(to: Routes.screen_path(conn, :index))
  end
end
