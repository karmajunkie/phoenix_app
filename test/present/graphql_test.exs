defmodule Present.GraphQLTest do
  use Present.DataCase

  alias Present.{ Accounts, Accounts.UserPlace, Accounts.User }


  setup do
    {:ok, user} = Accounts.create_user(%{email: "test@example.com", password: "password"})
    {:ok, place} = Present.Map.create_place(%{ title: "home" })
    {:ok, userplace} = Accounts.create_user_place(%{user_id: user.id, place_id: place.id})
    {:ok, user: user, place: place, userplace: userplace}
  end


  test "users don't need userplace to resolve", _ctx do
    %{data: %{"places" => [ %{"users"  => [user]  } ] }} = """
    {
    places {
    id
    city
    department
    latitude
    longitude
    title
    users {
    id
    email
    inserted_at
    }
    }
    }
    """
    |> Absinthe.run!(Present.Web.Schema )

    assert Map.has_key?(user, "inserted_at")
  end

  test "user_place resolves independently", _ctx do
    %{data: %{"places" => [ %{ "userPlaces" => [userplace | _]} ] }} = """
    {
    places {
    userPlaces {
    id
    inserted_at
    }
    }
    }
    """
    |> Absinthe.run!(Present.Web.Schema )

    assert Map.has_key?(userplace, "inserted_at")
  end

  test "inserted_at attribute", _ctx do
    %{data: %{"places" => [ %{"users"  => [user],  "user_places" => [userplace | _]} ] }} = """
    {
      places {
      id
      city
      department
      latitude
      longitude
      title
      users {
        id
        email
        inserted_at
      }
      user_places {
        id
        inserted_at
        }
      }
    }
    """
    |> Absinthe.run!(Present.Web.Schema )

    assert Map.has_key?(userplace, "inserted_at")
    assert Map.has_key?(user, "inserted_at")
  end

end
