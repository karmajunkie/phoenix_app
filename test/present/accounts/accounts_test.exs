defmodule Present.AccountsTest do
  use Present.DataCase

  alias Present.Accounts

  describe "users" do
    alias Present.Accounts.User

    @valid_attrs %{email: "some email", name: "some name"}
    @update_attrs %{email: "some updated email", name: "some updated name"}
    @invalid_attrs %{email: nil, name: nil}

    def user_fixture(attrs \\ %{}) do
      {:ok, user} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Accounts.create_user()

      user
    end

    test "list_users/0 returns all users" do
      user = user_fixture()
      assert Accounts.list_users() == [user]
    end

    test "get_user!/1 returns the user with given id" do
      user = user_fixture()
      assert Accounts.get_user!(user.id) == user
    end

    test "create_user/1 with valid data creates a user" do
      assert {:ok, %User{} = user} = Accounts.create_user(@valid_attrs)
      assert user.email == "some email"
      assert user.name == "some name"
    end

    test "create_user/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Accounts.create_user(@invalid_attrs)
    end

    test "update_user/2 with valid data updates the user" do
      user = user_fixture()
      assert {:ok, user} = Accounts.update_user(user, @update_attrs)
      assert %User{} = user
      assert user.email == "some updated email"
      assert user.name == "some updated name"
    end

    test "update_user/2 with invalid data returns error changeset" do
      user = user_fixture()
      assert {:error, %Ecto.Changeset{}} = Accounts.update_user(user, @invalid_attrs)
      assert user == Accounts.get_user!(user.id)
    end

    test "delete_user/1 deletes the user" do
      user = user_fixture()
      assert {:ok, %User{}} = Accounts.delete_user(user)
      assert_raise Ecto.NoResultsError, fn -> Accounts.get_user!(user.id) end
    end

    test "change_user/1 returns a user changeset" do
      user = user_fixture()
      assert %Ecto.Changeset{} = Accounts.change_user(user)
    end
  end

  describe "userplaces" do
    alias Present.Accounts.UserPlace

    @valid_attrs %{}
    @update_attrs %{}
    @invalid_attrs %{}

    def user_place_fixture(attrs \\ %{}) do
      {:ok, user_place} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Accounts.create_user_place()

      user_place
    end

    test "list_userplaces/0 returns all userplaces" do
      user_place = user_place_fixture()
      assert Accounts.list_userplaces() == [user_place]
    end

    test "get_user_place!/1 returns the user_place with given id" do
      user_place = user_place_fixture()
      assert Accounts.get_user_place!(user_place.id) == user_place
    end

    test "create_user_place/1 with valid data creates a user_place" do
      assert {:ok, %UserPlace{} = user_place} = Accounts.create_user_place(@valid_attrs)
    end

    test "create_user_place/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Accounts.create_user_place(@invalid_attrs)
    end

    test "update_user_place/2 with valid data updates the user_place" do
      user_place = user_place_fixture()
      assert {:ok, user_place} = Accounts.update_user_place(user_place, @update_attrs)
      assert %UserPlace{} = user_place
    end

    test "update_user_place/2 with invalid data returns error changeset" do
      user_place = user_place_fixture()
      assert {:error, %Ecto.Changeset{}} = Accounts.update_user_place(user_place, @invalid_attrs)
      assert user_place == Accounts.get_user_place!(user_place.id)
    end

    test "delete_user_place/1 deletes the user_place" do
      user_place = user_place_fixture()
      assert {:ok, %UserPlace{}} = Accounts.delete_user_place(user_place)
      assert_raise Ecto.NoResultsError, fn -> Accounts.get_user_place!(user_place.id) end
    end

    test "change_user_place/1 returns a user_place changeset" do
      user_place = user_place_fixture()
      assert %Ecto.Changeset{} = Accounts.change_user_place(user_place)
    end
  end

end
