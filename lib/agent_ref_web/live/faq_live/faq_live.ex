defmodule AgentRefWeb.FaqLive.Index do
  use AgentRefWeb, :live_view

  import AgentRefWeb.Utils

  alias AgentRef.Questions


  def mount(_params, _session, socket) do
    {:ok,
     assign(socket,
       submitted: false,
       general_items: Questions.general_faqs(),
       map_items: Questions.map_faqs()

     )}
  end

  def list_item(assigns) do
    ~H"""
    <div class="w-full pt-6">
      <dt>
        <button
          type="button"
          class="flex w-full items-start justify-between text-left"
          phx-click={toggle_faq(@id)}
          phx-value-id={@id}
          id={"faq_toggle_#{@id}"}
          aria-controls={"faq-#{@id}"}
          aria-expanded={@id}
        >
          <span class="flex-grow pb-2 text-2xl font-semibold leading-7 2xs:text-sm xs:text-base sm:text-lg md:text-xl lg:text-xl">
            <%= @question %>
          </span>
          <span class="ml-6 flex h-7 items-center">
            <svg
              class="text-[#33669A] hidden h-7 w-7 origin-center"
              id={"#{@id}_minus"}
              fill="none"
              viewBox="0 0 24 24"
              stroke-width="1.5"
              stroke="currentColor"
              aria-hidden="true"
            >
              <path stroke-linecap="round" stroke-linejoin="round" d="M18 12H6" />
            </svg>
            <svg
              class="text-[#33669A] h-7 w-7 origin-center"
              id={"#{@id}_plus"}
              fill="none"
              viewBox="0 0 24 24"
              stroke-width="1.5"
              stroke="currentColor"
              aria-hidden="true"
            >
              <path stroke-linecap="round" stroke-linejoin="round" d="M12 6v12m6-6H6" />
            </svg>
          </span>
        </button>
      </dt>
      <dd
        class="grid-rows-[0fr] overflow-hidden pr-6 transition-all duration-300 ease-in-out"
        style="display: grid!important"
        id={@id}
      >
        <div class="overflow-hidden">
          <p class={"text-#{@answer_color} pb-1 text-2xl leading-7 2xs:text-sm xs:text-base sm:text-lg md:text-xl lg:text-xl"}>
            <%= @answer %>
          </p>
        </div>
      </dd>
    </div>
    """
  end
end
