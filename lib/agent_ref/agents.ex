defmodule AgentRef.Agents do
  @moduledoc """
  The Agents context.
  """

  import Ecto.Query, warn: false
  alias AgentRef.Repo

  alias AgentRef.Agents.Agent

  @doc """
  Returns the list of agents.

  ## Examples

      iex> list_agents()
      [%Agent{}, ...]

  """
  def list_agents do
    Repo.all(Agent)
  end

  @doc """
  Gets a single agent.

  Raises `Ecto.NoResultsError` if the Agent does not exist.

  ## Examples

      iex> get_agent!(123)
      %Agent{}

      iex> get_agent!(456)
      ** (Ecto.NoResultsError)

  """
  def get_agent!(id), do: Repo.get!(Agent, id)

  @doc """
  Creates a agent.

  ## Examples

      iex> create_agent(%{field: value})
      {:ok, %Agent{}}

      iex> create_agent(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
def change_agent(%Agent{} = agent, attrs \\ %{}, current_user \\ nil) do
  Agent.changeset(agent, attrs, current_user)
end

def create_agent(attrs \\ %{}, current_user) do
  %Agent{}
  |> Agent.changeset(attrs, current_user)
  |> Repo.insert()
end

def update_agent(%Agent{} = agent, attrs, current_user) do
  agent
  |> Agent.changeset(attrs, current_user)
  |> Repo.update()
end

  @doc """
  Deletes a agent.

  ## Examples

      iex> delete_agent(agent)
      {:ok, %Agent{}}

      iex> delete_agent(agent)
      {:error, %Ecto.Changeset{}}

  """
  def delete_agent(%Agent{} = agent) do
    Repo.delete(agent)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking agent changes.

  ## Examples

      iex> change_agent(agent)
      %Ecto.Changeset{data: %Agent{}}

  """
end
