defmodule Present.Accounts do
  @moduledoc """
  The boundary for the Accounts system.
  """

  import Ecto.Query, warn: false
  alias Present.Repo

  alias Present.Accounts.{
    User,
    UserPlace
  }

  @doc """
  Returns the list of users.

  ## Examples

      iex> list_users()
      [%User{}, ...]

  """
  def list_users do
    Repo.all(User)
  end

  @doc """
  Gets a single user.

  Raises `Ecto.NoResultsError` if the User does not exist.

  ## Examples

      iex> get_user!(123)
      %User{}

      iex> get_user!(456)
      ** (Ecto.NoResultsError)

      iex> get_user(%{"email" => "a@b.c"})
      nil

  """
  def get_user!(id), do: Repo.get!(User, id)
  def get_user(%{"email" => email}) do
    Repo.get_by(User, email: String.downcase(email))
  end
  def get_user(%{"username" => username}) do
    Repo.get_by(User, username: String.downcase(username))
  end


  @doc """
  Creates a user.

  ## Examples

      iex> create_user(%{field: value})
      {:ok, %User{}}

      iex> create_user(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_user(attrs \\ %{}) do
    %User{}
    |> User.create_changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a user.

  ## Examples

      iex> update_user(user, %{field: new_value})
      {:ok, %User{}}

      iex> update_user(user, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_user(%User{} = user, attrs) do
    user
    |> User.update_changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a User.

  ## Examples

      iex> delete_user(user)
      {:ok, %User{}}

      iex> delete_user(user)
      {:error, %Ecto.Changeset{}}

  """
  def delete_user(%User{} = user) do
    Repo.delete(user)
  end

  @doc """
  Returns the list of userplaces.

  ## Examples

      iex> list_userplaces()
      [%UserPlace{}, ...]

  """
  def list_userplaces do
    Repo.all(UserPlace)
  end
  def list_userplaces(%{"user_id" => user_id}) do
    UserPlace
    |> where(user_id: ^user_id)
    |> Repo.all
  end
  def list_userplaces(%{"place_id" => place_id}) do
    UserPlace
    |> where(place_id: ^place_id)
    |> Repo.all
  end

  @doc """
  Gets a single user_place.

  Raises `Ecto.NoResultsError` if the User place does not exist.

  ## Examples

      iex> get_user_place!(123)
      %UserPlace{}

      iex> get_user_place!(456)
      ** (Ecto.NoResultsError)

  """
  def get_user_place!(id), do: Repo.get!(UserPlace, id)

  @doc """
  Creates a user_place.

  ## Examples

      iex> create_user_place(%{field: value})
      {:ok, %UserPlace{}}

      iex> create_user_place(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_user_place(attrs \\ %{}) do
    %UserPlace{}
    |> UserPlace.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a user_place.

  ## Examples

      iex> update_user_place(user_place, %{field: new_value})
      {:ok, %UserPlace{}}

      iex> update_user_place(user_place, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_user_place(%UserPlace{} = user_place, attrs) do
    user_place
    |> UserPlace.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a UserPlace.

  ## Examples

      iex> delete_user_place(user_place)
      {:ok, %UserPlace{}}

      iex> delete_user_place(user_place)
      {:error, %Ecto.Changeset{}}

  """
  def delete_user_place(%UserPlace{} = user_place) do
    Repo.delete(user_place)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking user_place changes.

  ## Examples

      iex> change_user_place(user_place)
      %Ecto.Changeset{source: %UserPlace{}}

  """
  def change_user_place(%UserPlace{} = user_place) do
    UserPlace.changeset(user_place, %{})
  end

end
