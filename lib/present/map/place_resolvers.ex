defmodule Present.Map.Place.Resolvers do
  import Logger
  alias Present.{Map, Session}


  @doc"""
  get all places
  """
  def all(_args, _info) do
    {:ok, Map.list_places()}
  end
  @doc"""
  def all(_args, %{context: %{current_user: current_user}}) do
    {:ok, Map.list_places() ++ Map.list_places(current_user)}
  end
  """

  @doc"""
  get all places for current user
  """
  def me(_args, %{context: %{current_user: current_user}}) do
    {:ok, Map.list_places(current_user)}
  end

  @doc"""
  get a place by attributes
  """
  def place(%{title: place_title}, _info) do
    {:ok, Map.get_place(%{"title" => place_title})}
  end
  def place(_args, _info) do
    {:error, "place not found"}
  end

  @doc"""
  update place if current user belongs to it and is a guardian
  """
  def update(%{id: place_id, place: place_attrs}, %{context: %{current_user: %{id: current_user_id}}}) do
    current_user_places = Present.Accounts.list_userplaces(%{"user_id" => current_user_id})
    current_user_place = Enum.find(current_user_places, &(&1.place_id === place_id))

    cond do
      is_nil(current_user_place) -> {:error, "User does not belong to that place"}
      true -> Map.update_place(Map.get_place!(place_id), place_attrs)
    end
  end

end
