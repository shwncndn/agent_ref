defmodule AgentRef.Repo do
  use Ecto.Repo,
    otp_app: :agent_ref,
    adapter: Ecto.Adapters.Postgres
end
