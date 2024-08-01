defmodule AgentRefWeb.AgentLiveTest do
  use AgentRefWeb.ConnCase

  import Phoenix.LiveViewTest
  import AgentRef.AgentsFixtures

  @create_attrs %{state: "some state", address: "some address", first_name: "some first_name", last_name: "some last_name", license: 42, email: "some email", city: "some city", county: "some county", brokerage: "some brokerage", broker_phone: 42, agent_phone: 42, broker_email: "some broker_email", submitted_by: "some submitted_by"}
  @update_attrs %{state: "some updated state", address: "some updated address", first_name: "some updated first_name", last_name: "some updated last_name", license: 43, email: "some updated email", city: "some updated city", county: "some updated county", brokerage: "some updated brokerage", broker_phone: 43, agent_phone: 43, broker_email: "some updated broker_email", submitted_by: "some updated submitted_by"}
  @invalid_attrs %{state: nil, address: nil, first_name: nil, last_name: nil, license: nil, email: nil, city: nil, county: nil, brokerage: nil, broker_phone: nil, agent_phone: nil, broker_email: nil, submitted_by: nil}

  defp create_agent(_) do
    agent = agent_fixture()
    %{agent: agent}
  end

  describe "Index" do
    setup [:create_agent]

    test "lists all agents", %{conn: conn, agent: agent} do
      {:ok, _index_live, html} = live(conn, ~p"/agents")

      assert html =~ "Listing Agents"
      assert html =~ agent.state
    end

    test "saves new agent", %{conn: conn} do
      {:ok, index_live, _html} = live(conn, ~p"/agents")

      assert index_live |> element("a", "New Agent") |> render_click() =~
               "New Agent"

      assert_patch(index_live, ~p"/agents/new")

      assert index_live
             |> form("#agent-form", agent: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      assert index_live
             |> form("#agent-form", agent: @create_attrs)
             |> render_submit()

      assert_patch(index_live, ~p"/agents")

      html = render(index_live)
      assert html =~ "Agent created successfully"
      assert html =~ "some state"
    end

    test "updates agent in listing", %{conn: conn, agent: agent} do
      {:ok, index_live, _html} = live(conn, ~p"/agents")

      assert index_live |> element("#agents-#{agent.id} a", "Edit") |> render_click() =~
               "Edit Agent"

      assert_patch(index_live, ~p"/agents/#{agent}/edit")

      assert index_live
             |> form("#agent-form", agent: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      assert index_live
             |> form("#agent-form", agent: @update_attrs)
             |> render_submit()

      assert_patch(index_live, ~p"/agents")

      html = render(index_live)
      assert html =~ "Agent updated successfully"
      assert html =~ "some updated state"
    end

    test "deletes agent in listing", %{conn: conn, agent: agent} do
      {:ok, index_live, _html} = live(conn, ~p"/agents")

      assert index_live |> element("#agents-#{agent.id} a", "Delete") |> render_click()
      refute has_element?(index_live, "#agents-#{agent.id}")
    end
  end

  describe "Show" do
    setup [:create_agent]

    test "displays agent", %{conn: conn, agent: agent} do
      {:ok, _show_live, html} = live(conn, ~p"/agents/#{agent}")

      assert html =~ "Show Agent"
      assert html =~ agent.state
    end

    test "updates agent within modal", %{conn: conn, agent: agent} do
      {:ok, show_live, _html} = live(conn, ~p"/agents/#{agent}")

      assert show_live |> element("a", "Edit") |> render_click() =~
               "Edit Agent"

      assert_patch(show_live, ~p"/agents/#{agent}/show/edit")

      assert show_live
             |> form("#agent-form", agent: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      assert show_live
             |> form("#agent-form", agent: @update_attrs)
             |> render_submit()

      assert_patch(show_live, ~p"/agents/#{agent}")

      html = render(show_live)
      assert html =~ "Agent updated successfully"
      assert html =~ "some updated state"
    end
  end
end
