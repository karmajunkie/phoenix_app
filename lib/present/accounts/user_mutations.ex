defmodule Present.Accounts.User.Mutations do
  use Absinthe.Schema.Notation
  alias Present.{
    Accounts.User.Resolvers
  }


  input_object :update_user_attrs do
    field :username, :string
    field :email, :string
    field :password, :string
  end

  object :user_mutations do
    @desc "Update user by id"
    field :update_user, type: :user do
      arg :id, non_null(:integer)
      arg :user, :update_user_attrs

      resolve &Resolvers.update/2
    end
  end
end
