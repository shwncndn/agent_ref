defmodule AgentRef.Repo.Migrations.AddLatLongToAgent do
  use Ecto.Migration

  def change do
    alter table("agents") do
      add :latitude, :float
      add :longitude, :float
      
    end
  end
end
