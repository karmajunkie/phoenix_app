defmodule Present.Map.Place.Types do
  use Absinthe.Schema.Notation
  use Absinthe.Ecto, repo: Present.Repo # provides assoc helper function


  object :place do
    field :id, :id
    field :city, :string
    field :department, :string
    field :latitude, :float
    field :longitude, :float
    field :title, :string
    field :users, list_of(:user), resolve: assoc(:users)
    field :user_places, list_of(:user_place), resolve: assoc(:users)
  end
end
