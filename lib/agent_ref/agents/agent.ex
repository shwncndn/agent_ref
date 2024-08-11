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
    field :longitude, :float
    field :latitude, :float

    timestamps(type: :utc_datetime)
  end

  @doc false
  @doc false
def changeset(agent, attrs, current_user \\ nil) do
  agent
  |> cast(attrs, [:first_name, :last_name, :license, :email, :state, :city, :county, :brokerage, :address, :broker_phone, :agent_phone, :broker_email, :longitude, :latitude])
  |> maybe_put_submitted_by(current_user)
  |> validate_required([:first_name, :last_name, :license, :email, :state, :city, :county, :brokerage, :address, :broker_phone, :agent_phone, :broker_email, :longitude, :latitude])
end

defp maybe_put_submitted_by(changeset, %{email: email}) when is_binary(email) do
  put_change(changeset, :submitted_by, email)
end
defp maybe_put_submitted_by(changeset, _), do: changeset
end
