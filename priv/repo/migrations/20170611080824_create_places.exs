defmodule Present.Repo.Migrations.CreatePresent.Map.Schema.Place do
  use Ecto.Migration

  def change do
    create table(:places) do
      add :city, :string
      add :department, :string
      add :latitude, :float
      add :longitude, :float
      add :title, :string

      timestamps()
    end

  end
end
