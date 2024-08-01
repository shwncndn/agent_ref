defmodule AgentRef.Repo.Migrations.CreateAgents do
  use Ecto.Migration

  def change do
    create table(:agents) do
      add :first_name, :string
      add :last_name, :string
      add :license, :integer
      add :email, :string
      add :state, :string
      add :city, :string
      add :county, :string
      add :brokerage, :string
      add :address, :string
      add :broker_phone, :integer
      add :agent_phone, :integer
      add :broker_email, :string
      add :submitted_by, :string

      timestamps(type: :utc_datetime)
    end
  end
end
