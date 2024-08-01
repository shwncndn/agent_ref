defmodule AgentRef.AgentsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `AgentRef.Agents` context.
  """

  @doc """
  Generate a agent.
  """
  def agent_fixture(attrs \\ %{}) do
    {:ok, agent} =
      attrs
      |> Enum.into(%{
        address: "some address",
        agent_phone: 42,
        broker_email: "some broker_email",
        broker_phone: 42,
        brokerage: "some brokerage",
        city: "some city",
        county: "some county",
        email: "some email",
        first_name: "some first_name",
        last_name: "some last_name",
        license: 42,
        state: "some state",
        submitted_by: "some submitted_by"
      })
      |> AgentRef.Agents.create_agent()

    agent
  end
end
