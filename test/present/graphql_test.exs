defmodule Present.GraphQLTest do
  use Present.DataCase

  alias Present.{ Accounts }


  setup do
    {:ok, user} = Accounts.create_user(%{email: "test@example.com", password: "password"})
    {:ok, place} = Present.Map.create_place(%{ title: "home" })
    {:ok, userplace} = Accounts.create_user_place(%{user_id: user.id, place_id: place.id})
    {:ok, user: user, place: place, userplace: userplace}
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
