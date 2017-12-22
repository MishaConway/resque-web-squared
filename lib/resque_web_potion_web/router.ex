defmodule ResqueWebPotionWeb.Router do
  use ResqueWebPotionWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", ResqueWebPotionWeb do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
    get "/queues", QueuesController, :index
    get "/working", WorkingController, :index
    get "/workers", WorkersController, :index

    get "/failed", FailedController, :index
    get "/failed/page/:page", FailedController, :page
  end

  # Other scopes may use custom stacks.
  # scope "/api", ResqueWebPotionWeb do
  #   pipe_through :api
  # end
end
