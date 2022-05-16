defmodule Layar.Overlay do
  @moduledoc """
  The Overlay context.
  """

  import Ecto.Query, warn: false
  alias Layar.Repo

  alias Layar.Overlay.Theme

  @doc """
  Returns the list of themes.

  ## Examples

      iex> list_themes()
      [%Theme{}, ...]

  """
  def list_themes do
    Repo.all(Theme)
  end

  @doc """
  Gets a single theme.

  Raises `Ecto.NoResultsError` if the Theme does not exist.

  ## Examples

      iex> get_theme!(123)
      %Theme{}

      iex> get_theme!(456)
      ** (Ecto.NoResultsError)

  """
  def get_theme!(id), do: Repo.get!(Theme, id)

  @doc """
  Creates a theme.

  ## Examples

      iex> create_theme(%{field: value})
      {:ok, %Theme{}}

      iex> create_theme(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_theme(attrs \\ %{}) do
    %Theme{}
    |> Theme.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a theme.

  ## Examples

      iex> update_theme(theme, %{field: new_value})
      {:ok, %Theme{}}

      iex> update_theme(theme, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_theme(%Theme{} = theme, attrs) do
    theme
    |> Theme.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a theme.

  ## Examples

      iex> delete_theme(theme)
      {:ok, %Theme{}}

      iex> delete_theme(theme)
      {:error, %Ecto.Changeset{}}

  """
  def delete_theme(%Theme{} = theme) do
    Repo.delete(theme)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking theme changes.

  ## Examples

      iex> change_theme(theme)
      %Ecto.Changeset{data: %Theme{}}

  """
  def change_theme(%Theme{} = theme, attrs \\ %{}) do
    Theme.changeset(theme, attrs)
  end

  alias Layar.Overlay.Screen

  @doc """
  Returns the list of screens.

  ## Examples

      iex> list_screens()
      [%Screen{}, ...]

  """
  def list_screens do
    Repo.all(Screen)
  end

  @doc """
  Gets a single screen.

  Raises `Ecto.NoResultsError` if the Screen does not exist.

  ## Examples

      iex> get_screen!(123)
      %Screen{}

      iex> get_screen!(456)
      ** (Ecto.NoResultsError)

  """
  def get_screen!(id), do: Repo.get!(Screen, id)

  @doc """
  Creates a screen.

  ## Examples

      iex> create_screen(%{field: value})
      {:ok, %Screen{}}

      iex> create_screen(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_screen(attrs \\ %{}) do
    %Screen{}
    |> Screen.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a screen.

  ## Examples

      iex> update_screen(screen, %{field: new_value})
      {:ok, %Screen{}}

      iex> update_screen(screen, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_screen(%Screen{} = screen, attrs) do
    screen
    |> Screen.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a screen.

  ## Examples

      iex> delete_screen(screen)
      {:ok, %Screen{}}

      iex> delete_screen(screen)
      {:error, %Ecto.Changeset{}}

  """
  def delete_screen(%Screen{} = screen) do
    Repo.delete(screen)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking screen changes.

  ## Examples

      iex> change_screen(screen)
      %Ecto.Changeset{data: %Screen{}}

  """
  def change_screen(%Screen{} = screen, attrs \\ %{}) do
    Screen.changeset(screen, attrs)
  end
end
