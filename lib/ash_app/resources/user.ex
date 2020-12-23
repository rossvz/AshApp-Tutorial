defmodule AshApp.User do
  use Ash.Resource, data_layer: AshPostgres.DataLayer, extensions: [AshJsonApi.Resource]

  attributes do
    uuid_primary_key :id

    attribute :first_name, :string do
      allow_nil? false
    end

    attribute :last_name, :string do
      allow_nil? false
    end
  end

  relationships do
    has_many :games, AshApp.Game, destination_field: :user_id
  end

  postgres do
    repo(AshApp.Repo)
    table "users"
  end

  actions do
    create :default
    read :default
    update :default
  end

  ### API

  json_api do
    type "user"

    routes do
      base "/users"
      get :read
      index :read
      post :create
      patch :update
    end
  end
end
