defmodule AgentRefWeb.DashLive.Index do
  use AgentRefWeb, :live_view

  def mount(_params, _session, socket) do
    {:ok, socket}
  end

  def render(assigns) do
    ~H"""
    Dashboard
    """
  end
end
