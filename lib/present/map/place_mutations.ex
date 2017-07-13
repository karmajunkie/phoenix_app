defmodule Present.Map.Place.Mutations do
  use Absinthe.Schema.Notation
  alias Present.{
    Map.Place.Resolvers,
    Web.Middleware
  }


  input_object :update_place_attrs do
    field :city, :string
    field :department, :string
    field :latitude, :float
    field :longitude, :float
    field :title, :string
  end

  object :place_mutations do
    @desc "Update place by id"
    field :update_place, type: :place do
      arg :id, non_null(:integer)
      arg :place, :update_place_attrs

      middleware Middleware.RequireAuthorized
      resolve &Resolvers.update/2
    end
  end
end
