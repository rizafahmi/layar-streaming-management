defmodule LayarWeb.PageController do
  use LayarWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
