defmodule Present.Accounts.UserPlace do
  use Ecto.Schema
  import Ecto.Changeset
  alias Present.{
    Accounts.User,
    Accounts.UserPlace,
    Map.Place
  }


  @doc"""
  ecto schema/struct for the user_places table
  representing the many-to-many relation between users, and places
  """
  schema "user_places" do
    belongs_to :user, User
    belongs_to :place, Place

    timestamps()
  end

  def changeset(%UserPlace{} = user_place, attrs) do
    user_place
    |> cast(attrs, [:user_id, :place_id])
    |> validate_required([:user_id, :place_id])
  end
end
