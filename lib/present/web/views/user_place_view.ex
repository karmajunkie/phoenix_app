defmodule Present.Web.UserPlaceView do
  use Present.Web, :view
  alias Present.Web.UserPlaceView

  def render("index.json", %{userplaces: userplaces}) do
    %{data: render_many(userplaces, UserPlaceView, "user_place.json")}
  end

  def render("show.json", %{user_place: user_place}) do
    %{data: render_one(user_place, UserPlaceView, "user_place.json")}
  end

  def render("user_place.json", %{user_place: user_place}) do
    %{id: user_place.id}
  end
end
