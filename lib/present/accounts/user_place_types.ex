defmodule Present.Accounts.UserPlace.Types do
  use Absinthe.Schema.Notation
  use Timex

  scalar :timestamptz, description: "ISOz time" do
    parse &Timex.parse(&1.value, "{ISO:Extended:Z}")
    serialize &Timex.format!(&1, "{ISO:Extended:Z}")
  end

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
