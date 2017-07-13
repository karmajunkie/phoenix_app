defmodule Present.Accounts.UserPlace.Types do
  use Absinthe.Schema.Notation
  use Absinthe.Ecto, repo: Present.Repo

  object :user_place do
    field :id, :id
    field :user_id, :id
    field :place_id, :id
  end
end
