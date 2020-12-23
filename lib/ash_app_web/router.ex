defmodule AshAppWeb.Router do
  use AshAppWeb, :router
  require AshJsonApi

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api" do
    pipe_through :api

    AshJsonApi.forward("/", AshApp.Api)
  end

  # Enables LiveDashboard only for development
  #
  # If you want to use the LiveDashboard in production, you should put
  # it behind authentication and allow only admins to access it.
  # If your application does not have an admins-only section yet,
  # you can use Plug.BasicAuth to set up some basic authentication
  # as long as you are also using SSL (which you should anyway).
  scope "/" do
    pipe_through [:fetch_session, :protect_from_forgery]
  end
end
