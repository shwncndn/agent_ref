defmodule AgentRef.AgentsTest do
  use AgentRef.DataCase

  alias AgentRef.Agents

  describe "agents" do
    alias AgentRef.Agents.Agent

    import AgentRef.AgentsFixtures

    @invalid_attrs %{state: nil, address: nil, first_name: nil, last_name: nil, license: nil, email: nil, city: nil, county: nil, brokerage: nil, broker_phone: nil, agent_phone: nil, broker_email: nil, submitted_by: nil}

    test "list_agents/0 returns all agents" do
      agent = agent_fixture()
      assert Agents.list_agents() == [agent]
    end

    test "get_agent!/1 returns the agent with given id" do
      agent = agent_fixture()
      assert Agents.get_agent!(agent.id) == agent
    end

    test "create_agent/1 with valid data creates a agent" do
      valid_attrs = %{state: "some state", address: "some address", first_name: "some first_name", last_name: "some last_name", license: 42, email: "some email", city: "some city", county: "some county", brokerage: "some brokerage", broker_phone: 42, agent_phone: 42, broker_email: "some broker_email", submitted_by: "some submitted_by"}

      assert {:ok, %Agent{} = agent} = Agents.create_agent(valid_attrs)
      assert agent.state == "some state"
      assert agent.address == "some address"
      assert agent.first_name == "some first_name"
      assert agent.last_name == "some last_name"
      assert agent.license == 42
      assert agent.email == "some email"
      assert agent.city == "some city"
      assert agent.county == "some county"
      assert agent.brokerage == "some brokerage"
      assert agent.broker_phone == 42
      assert agent.agent_phone == 42
      assert agent.broker_email == "some broker_email"
      assert agent.submitted_by == "some submitted_by"
    end

    test "create_agent/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Agents.create_agent(@invalid_attrs)
    end

    test "update_agent/2 with valid data updates the agent" do
      agent = agent_fixture()
      update_attrs = %{state: "some updated state", address: "some updated address", first_name: "some updated first_name", last_name: "some updated last_name", license: 43, email: "some updated email", city: "some updated city", county: "some updated county", brokerage: "some updated brokerage", broker_phone: 43, agent_phone: 43, broker_email: "some updated broker_email", submitted_by: "some updated submitted_by"}

      assert {:ok, %Agent{} = agent} = Agents.update_agent(agent, update_attrs)
      assert agent.state == "some updated state"
      assert agent.address == "some updated address"
      assert agent.first_name == "some updated first_name"
      assert agent.last_name == "some updated last_name"
      assert agent.license == 43
      assert agent.email == "some updated email"
      assert agent.city == "some updated city"
      assert agent.county == "some updated county"
      assert agent.brokerage == "some updated brokerage"
      assert agent.broker_phone == 43
      assert agent.agent_phone == 43
      assert agent.broker_email == "some updated broker_email"
      assert agent.submitted_by == "some updated submitted_by"
    end

    test "update_agent/2 with invalid data returns error changeset" do
      agent = agent_fixture()
      assert {:error, %Ecto.Changeset{}} = Agents.update_agent(agent, @invalid_attrs)
      assert agent == Agents.get_agent!(agent.id)
    end

    test "delete_agent/1 deletes the agent" do
      agent = agent_fixture()
      assert {:ok, %Agent{}} = Agents.delete_agent(agent)
      assert_raise Ecto.NoResultsError, fn -> Agents.get_agent!(agent.id) end
    end

    test "change_agent/1 returns a agent changeset" do
      agent = agent_fixture()
      assert %Ecto.Changeset{} = Agents.change_agent(agent)
    end
  end
end
