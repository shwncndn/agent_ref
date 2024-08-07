defmodule AgentRefWeb.Utils do

  alias Phoenix.LiveView.JS
  
  def toggle_faq(id \\ "") do
    class_expanded = "grid-rows-[1fr] pt-8 expanded"
    answer_id_selector = "##{id}"
    plus_id_selector = "##{id}_plus"
    minus_id_selector = "##{id}_minus"

    class_expanded
    |> JS.remove_class(to: "#{answer_id_selector}.expanded")
    |> JS.add_class(class_expanded, to: "#{answer_id_selector}:not(.expanded)")
    |> JS.show(to: minus_id_selector)
    |> JS.transition({"transform transition duration-200 ease-out", "opacity-0", "opacity-100"},
      to: plus_id_selector
    )
    |> JS.transition(
      {"transform rotate-180 transition duration-200 ease-out", "opacity-0", "opacity-100"},
      to: minus_id_selector
    )
    |> JS.hide(to: plus_id_selector)
    |> JS.hide(to: minus_id_selector)
    |> JS.transition({"transform transition duration-200 ease-out", "opacity-0", "opacity-100"},
      to: minus_id_selector
    )
    |> JS.transition(
      {"transform rotate-180 transition duration-200 ease-out", "opacity-0", "opacity-100"},
      to: plus_id_selector
    )
    |> JS.show(to: plus_id_selector)
  end
end
