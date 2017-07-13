defmodule Present.Map.Place do
  use Ecto.Schema
  import Ecto.Changeset

  alias Present.Accounts.{
    User,
    UserPlace
  }
  alias Present.Map.Place


  @doc"""
  ecto schema/struct for the places table
  """
  schema "places" do
    field :city, :string
    field :department, :string
    field :latitude, :float
    field :longitude, :float
    field :title, :string
    many_to_many :users, User, join_through: UserPlace
    #has_many :users, UserPlace

    timestamps()
  end

  def changeset(%Place{} = place, attrs) do
    place
    |> cast(attrs, [:title])
    |> validate_required([:title])
  end

  def create_changeset(%Place{} = place, attrs \\ %{}) do
    place
    |> cast(attrs, [:city, :department, :latitude, :longitude, :title])
    |> validate_required([:title])
  end

  def update_changeset(%Place{} = place, attrs \\ %{}) do
    place
    |> cast(attrs, [:city, :department, :latitude, :longitude, :title])
    |> validate_required([])
  end
end
