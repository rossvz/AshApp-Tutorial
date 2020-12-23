defmodule AshApp.Game do
  use Ash.Resource, data_layer: AshPostgres.DataLayer

  attributes do
    uuid_primary_key :id

    attribute :title, :string do
      allow_nil? false
    end

    attribute :platform, :string

    create_timestamp :created_at
    update_timestamp :updated_at
  end

  relationships do
    belongs_to :user, AshApp.User
  end

  postgres do
    repo(AshApp.Repo)
    table "games"
  end

  actions do
    create :default
    read :default
    update :default
    destroy :default
  end
end
