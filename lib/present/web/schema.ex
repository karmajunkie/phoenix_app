defmodule Present.Web.Schema do
  use Absinthe.Schema

  alias Present.{
    Accounts.User,
    Accounts.UserPlace,
    Map.Place,
    Session,
    Web.Middleware
  }

  import_types User.Types
  import_types User.Queries
  import_types User.Mutations

  import_types Place.Types
  import_types Place.Queries
  import_types Place.Mutations

  import_types UserPlace.Types

  import_types Session.Types
  import_types Session.Mutations

  query do
    import_fields :place_queries
    import_fields :user_queries
  end

  mutation do
    import_fields :place_mutations
    import_fields :user_mutations
    import_fields :session_mutations
  end

  @doc """
  handle and format changeset errors during mutations
  """
  def middleware(middleware, _field, %{identifier: :mutation}) do
    middleware ++ [Middleware.ChangesetErrorFormatter]
  end

  def middleware(middleware, _, _) do
    middleware
  end

end
