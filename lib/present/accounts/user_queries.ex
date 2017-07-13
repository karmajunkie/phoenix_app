defmodule Present.Accounts.User.Queries do
  use Absinthe.Schema.Notation
  alias Present.{
    Accounts.User.Resolvers,
    Web.Middleware
  }

  object :user_queries do
    @desc "Get all users"
    field :users, type: list_of(:user) do
      middleware Middleware.RequireAuthorized
      resolve &Resolvers.all/2
    end

    @desc "Get user by id"
    field :user, type: :user do
      arg :id, non_null(:id)

      middleware Middleware.RequireAuthorized
      resolve &Resolvers.find/2
    end

    @desc "Get the currently signed in user, or nil"
    field :current_user, type: :user do
      resolve &Resolvers.current/2
    end
  end
end
