defmodule LayarWeb.ScreenView do
  use LayarWeb, :view

  def slice(content) do
    String.slice(content, 0..75) <> " ..."
  end
end
