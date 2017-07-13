defmodule Present.Session.Types do
  use Absinthe.Schema.Notation


  object :session do
    field :token, :string
  end
end
