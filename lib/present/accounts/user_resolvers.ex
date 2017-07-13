defmodule Present.Accounts.User.Resolvers do
  alias Present.{Accounts, Session}
  import Logger


  def all(_args, _info) do
    Logger.info "LOOOOOOOOOOOOOOOOOOOL"
    {:ok, Accounts.list_users()}
  end

  def current(_args, %{context: %{current_user: %{id: id}}}) do
    {:ok, Accounts.get_user!(id)}
  end
  def current(_args, _context) do
    {:ok, nil}
  end

  def find(%{id: user_id}, _info) do
    {:ok, Accounts.get_user!(user_id)}
  end

  def update(%{id: user_id, user: user_attrs}, %{context: %{current_user: %{id: id}}}) do
    if user_id === id do
      Accounts.get_user!(user_id)
      |> Accounts.update_user(user_attrs)
    else
      Session.unauthorized()
    end
  end
  def update(_args, _info) do
    Session.unauthorized()
  end

end
