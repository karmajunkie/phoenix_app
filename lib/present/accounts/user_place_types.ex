defmodule Present.Accounts.UserPlace.Types do
  use Absinthe.Schema.Notation
  use Absinthe.Ecto, repo: Present.Repo

  scalar :timestamptz do
    parse &Timex.parse(&1.value, "{ISOz}")
    serialize &Timex.format!(&1, "{ISOz}")
  end

  object :user_place do
    field :id, :id
    field :user_id, :id
    field :place_id, :id
    field :inserted_at, :timestamptz
  end
end
