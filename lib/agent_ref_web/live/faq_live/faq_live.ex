defmodule AgentRefWeb.FaqLive.Index do
  use AgentRefWeb, :live_view

  alias AgentRef.Questions
  
  def mount(_params, _session, socket) do
    {:ok,
     assign(socket,
       submitted: false,
       general_items: Questions.general_faqs(),
       map_items: Questions.map_faqs(),

     )}
  end
end
