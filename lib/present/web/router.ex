defmodule Present.Web.Router do
  use Present.Web, :router

  pipeline :graphql do
    plug Guardian.Plug.VerifyHeader, realm: "Bearer"
    plug Guardian.Plug.LoadResource
    plug Present.Web.Context
  end

  scope "/graphql" do
    pipe_through :graphql

    forward "/", Absinthe.Plug,
      schema: Present.Web.Schema
  end

  forward "/", Absinthe.Plug.GraphiQL,
    schema: Present.Web.Schema
end
