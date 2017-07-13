defmodule Present.Web.Middleware.RequireAuthorized do
  @behaviour Absinthe.Middleware

  @moduledoc """
  Middleware to require authenticated user
  """

  def call(resolution, config) do
    case resolution.context do
      %{current_user: _} ->
        resolution
      _ ->
        Absinthe.Resolution.put_result(resolution, Present.Session.unauthorized())
    end
  end
end
