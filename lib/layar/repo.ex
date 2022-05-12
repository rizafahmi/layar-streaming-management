defmodule Layar.Repo do
  use Ecto.Repo,
    otp_app: :layar,
    adapter: Ecto.Adapters.Postgres
end
