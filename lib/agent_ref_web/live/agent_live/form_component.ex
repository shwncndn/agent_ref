defmodule AgentRefWeb.AgentLive.FormComponent do
  use AgentRefWeb, :live_component

  alias AgentRef.Agents

  @impl true
  @impl true
  @impl true
  def render(assigns) do
    ~H"""
    <div class="max-w-[1200px] mx-auto"> <!-- Increased max width and centered -->
      <.header>
        <%= @title %>
        <:subtitle>Use this form to manage agent records in your database.</:subtitle>
      </.header>

      <.simple_form
        for={@form}
        id="agent-form"
        phx-target={@myself}
        phx-change="validate"
        phx-submit="save"

      >
        <div class="grid grid-cols-1 lg:grid-cols-2 gap-8 mb-6">
          <div class="space-y-6">
            <.input field={@form[:first_name]} type="text" label="First name" />
            <.input field={@form[:last_name]} type="text" label="Last name" />
            <.input field={@form[:license]} type="number" label="License" />
            <.input field={@form[:email]} type="text" label="Email" />
            <.input field={@form[:state]} type="text" label="State" />
            <.input field={@form[:city]} type="text" label="City" />
          </div>

          <div class="space-y-6">
            <.input field={@form[:county]} type="text" label="County" />
            <.input field={@form[:brokerage]} type="text" label="Brokerage" />
            <.input field={@form[:address]} type="text" label="Address" />
            <.input field={@form[:broker_phone]} type="number" label="Broker phone" />
            <.input field={@form[:agent_phone]} type="number" label="Agent phone" />
            <.input field={@form[:broker_email]} type="text" label="Broker email" />
          </div>
        </div>

        <:actions>
          <.button phx-disable-with="Saving..." class="w-full lg:w-auto">Save Agent</.button>
        </:actions>
      </.simple_form>
    </div>
    """
  end

  @impl true
  @impl true
  def update(%{agent: agent, current_user: current_user} = assigns, socket) do
    changeset = Agents.change_agent(agent, %{}, current_user)

    {:ok,
     socket
     |> assign(assigns)
     |> assign(:changeset, changeset)
     |> assign(:current_user, current_user)
     |> assign_form(changeset)}
  end

  defp assign_form(socket, %Ecto.Changeset{} = changeset) do
    assign(socket, :form, to_form(changeset))
  end

  @impl true
  @impl true
  def handle_event("validate", %{"agent" => agent_params}, socket) do
    changeset =
      Agents.change_agent(socket.assigns.agent, agent_params, socket.assigns.current_user)

    {:noreply, assign(socket, form: to_form(changeset, action: :validate))}
  end

  def handle_event("save", %{"agent" => agent_params}, socket) do
    save_agent(socket, socket.assigns.action, agent_params)
  end

  defp save_agent(socket, :edit, agent_params) do
    case Agents.update_agent(socket.assigns.agent, agent_params, socket.assigns.current_user) do
      {:ok, agent} ->
        notify_parent({:saved, agent})

        {:noreply,
         socket
         |> put_flash(:info, "Agent updated successfully")
         |> push_patch(to: socket.assigns.patch)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, form: to_form(changeset))}
    end
  end

  defp save_agent(socket, :new, agent_params) do
    case Agents.create_agent(agent_params, socket.assigns.current_user) do
      {:ok, agent} ->
        notify_parent({:saved, agent})

        {:noreply,
         socket
         |> put_flash(:info, "Agent created successfully")
         |> push_patch(to: socket.assigns.patch)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, form: to_form(changeset))}
    end
  end

  defp save_agent(socket, :new, agent_params) do
    case Agents.create_agent(agent_params) do
      {:ok, agent} ->
        notify_parent({:saved, agent})

        {:noreply,
         socket
         |> put_flash(:info, "Agent created successfully")
         |> push_patch(to: socket.assigns.patch)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, form: to_form(changeset))}
    end
  end

  defp notify_parent(msg), do: send(self(), {__MODULE__, msg})
end
