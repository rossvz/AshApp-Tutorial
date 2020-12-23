defmodule AshApp.Repo do
  use AshPostgres.Repo,
    otp_app: :ash_app,
    adapter: Ecto.Adapters.Postgres
end
