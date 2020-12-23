defmodule AshApp.Api do
  use Ash.Api, extensions: [AshJsonApi.Api]

  resources do
    resource AshApp.Game
    resource AshApp.User
  end
end
