defmodule Present.Session do
  @moduledoc """
  The boundary for the Session system.
  """
  import Logger

  alias Present.{Accounts}

  @doc """
  Returns the user associated with `attrs.email` if hashed `attrs.password` matches `user.password_hash`.
  """
  def authenticate(attrs) do
    user = Accounts.get_user(%{"email" => attrs.email})

    case check_password(user, attrs.password) do
      true -> {:ok, user}
      _ -> {:error, "invalid_credentials"}
    end
  end

  defp check_password(user, password) do
    case user do
      nil -> false
      _ -> Comeonin.Bcrypt.checkpw(password, user.password_hash)
    end
  end

  def register(attrs) do
    user = Accounts.get_user(%{"email" => attrs.email})
    user2 = Accounts.get_user(%{"username" => attrs.username})
    cond do
      is_nil(user) && is_nil(user2) -> Accounts.create_user(attrs)
      !is_nil(user) -> {:error, "unavailable_email"}
      !is_nil(user2) -> {:error, "unavailable_username"}
    end
  end

  def unauthorized() do
    {:error, %{message: "Not Authorized", status: 401}}
  end
end
