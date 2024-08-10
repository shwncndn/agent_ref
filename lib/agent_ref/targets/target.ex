defmodule AgentRef.Targets.Target do
  use Ecto.Schema
  import Ecto.Changeset

  schema "targets" do
    field :name, :string
    field :lat, :float
    field :lng, :float

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(target, attrs) do
    target
    |> cast(attrs, [:name, :lat, :lng])
    |> validate_required([:name, :lat, :lng])
  end
end
