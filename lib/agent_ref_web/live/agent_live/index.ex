defmodule AgentRefWeb.AgentLive.Index do
  use AgentRefWeb, :live_view

  alias AgentRef.Agents
  alias AgentRef.Agents.Agent
  alias AgentRef.Accounts

  @impl true
  def mount(_params, session, socket) do
    current_user =
      case session do
        %{"user_token" => token} -> Accounts.get_user_by_session_token(token)
        _ -> nil
      end

    IO.inspect(current_user, label: "Current User after fetching")

    {:ok,
     socket
     |> assign(:current_user, current_user)
     |> stream(:agents, AgentRef.Agents.list_agents())}
  end

  @impl true
  def handle_params(params, _url, socket) do
    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  end

  defp apply_action(socket, :edit, %{"id" => id}) do
    socket
    |> assign(:page_title, "Edit Agent")
    |> assign(:agent, Agents.get_agent!(id))
  end

  defp apply_action(socket, :new, _params) do
    socket
    |> assign(:page_title, "New Agent")
    |> assign(:agent, %Agent{})
  end

  defp apply_action(socket, :index, _params) do
    socket
    |> assign(:page_title, "Listing Agents")
    |> assign(:agent, nil)
  end

  @impl true
  def handle_info({AgentRefWeb.AgentLive.FormComponent, {:saved, agent}}, socket) do
    {:noreply, stream_insert(socket, :agents, agent)}
  end

  @impl true
  def handle_event("delete", %{"id" => id}, socket) do
    agent = Agents.get_agent!(id)
    {:ok, _} = Agents.delete_agent(agent)

    {:noreply, stream_delete(socket, :agents, agent)}
  end
end
