defmodule AgentRef.Agents.Agent do
  use Ecto.Schema
  import Ecto.Changeset

  schema "agents" do
    field :state, :string
    field :address, :string
    field :first_name, :string
    field :last_name, :string
    field :license, :integer
    field :email, :string
    field :city, :string
    field :county, :string
    field :brokerage, :string
    field :broker_phone, :integer
    field :agent_phone, :integer
    field :broker_email, :string
    field :submitted_by, :string

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(agent, attrs, current_user) do
    agent
    |> cast(attrs, [:first_name, :last_name, :license, :email, :state, :city, :county, :brokerage, :address, :broker_phone, :agent_phone, :broker_email, :submitted_by])
    |> put_change(:submitted_by, current_user.email)
    |> validate_required([:first_name, :last_name, :license, :email, :state, :city, :county, :brokerage, :address, :broker_phone, :agent_phone, :broker_email, :submitted_by])
  end
end
