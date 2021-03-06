defmodule AshApp.Repo.Migrations.MigrateResources1 do
  @moduledoc """
  Updates resources based on their most recent snapshots.

  This file was autogenerated with `mix ash_postgres.generate_migrations`
  """

  use Ecto.Migration

  def up() do
    create table(:games, primary_key: false) do
      add(:id, :binary_id, null: false, default: nil, primary_key: true)
      add(:updated_at, :utc_datetime, null: true, default: fragment("now()"), primary_key: false)
      add(:title, :text, null: false, default: nil, primary_key: false)
      add(:platform, :text, null: true, default: nil, primary_key: false)
      add(:created_at, :utc_datetime, null: true, default: fragment("now()"), primary_key: false)
    end
  end

  def down() do
    drop(table("games"))
  end
end