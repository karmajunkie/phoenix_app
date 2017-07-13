defmodule Present.Map.Place.Queries do
  use Absinthe.Schema.Notation
  alias Present.{
    Map.Place.Resolvers,
    Web.Middleware
  }

  object :place_queries do
    @desc "Get all places"
    field :places, type: list_of(:place) do
      resolve &Resolvers.all/2
    end

    @desc "Get my places"
    field :my_places, type: list_of(:place) do
      middleware Middleware.RequireAuthorized
      resolve &Resolvers.me/2
    end

    @desc "Get place by title"
    field :place, type: :place do
      arg :title, :string

      resolve &Resolvers.place/2
    end
  end
end
