defmodule Present.Web.PlaceView do
  use Present.Web, :view
  alias Present.Web.PlaceView

  def render("index.json", %{places: places}) do
    %{data: render_many(places, PlaceView, "place.json")}
  end

  def render("show.json", %{place: place}) do
    %{data: render_one(place, PlaceView, "place.json")}
  end

  def render("place.json", %{place: place}) do
    %{id: place.id,
      title: place.title}
  end
end
