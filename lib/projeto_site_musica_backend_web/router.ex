defmodule ProjetoSiteMusicaBackendWeb.Router do
  use ProjetoSiteMusicaBackendWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", ProjetoSiteMusicaBackendWeb do
    pipe_through :api

    scope "/users" do
      post "/register", UserController, :register
      post "/login", UserController, :login
    end

    scope "/albums" do
      get "", AlbumController, :list
      get "/:id", AlbumController, :show
      post "/new", AlbumController, :create
      delete "/:id", AlbumController, :delete
      get "/:id/songs", SongController, :songs
    end

    scope "/songs" do
      post "/new", SongController, :create
      delete "/:id", SongController, :delete
    end
  end
end
