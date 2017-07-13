defmodule Present.Session.Resolvers do
  alias Present.Repo

  def login(attrs, _info) do
    with {:ok, user} <- Present.Session.authenticate(attrs),
         {:ok, jwt, _ } <- Guardian.encode_and_sign(user, :access) do
      {:ok, %{token: jwt}}
    else
      {:error, message} -> {:error, %{
        message: message,
        operationName: "login"
      }}
    end
  end

  def register(attrs, _info) do
    with {:ok, user} <- Present.Session.register(attrs),
         {:ok, jwt, _ } <- Guardian.encode_and_sign(user, :access) do
      {:ok, %{token: jwt}}
    else
      {:error, message} -> {:error, %{
        message: message,
        operationName: "register"
      }}
    end
  end

end
