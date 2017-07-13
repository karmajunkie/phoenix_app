defmodule Present.Accounts.User.Types do
  use Absinthe.Schema.Notation
  use Absinthe.Ecto, repo: Present.Repo

  @email_regexp ~r/^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,4}$/

  def parse_and_validate_is_email(email) do
    case Regex.match?(@email_regexp, email) do
      false -> :error
      true -> {:ok, email}
    end
  end

  scalar :email do
    name "Email"
    description "User's Email"
    serialize fn(x) -> x end
    parse &parse_and_validate_is_email(&1.value)
  end

  object :user do
    field :id, :id
    field :username, :string
    field :email, :string
    field :password_hash, :string
    field :inserted_at, :timestamptz
    field :places, list_of(:place), resolve: assoc(:places)
  end
end
