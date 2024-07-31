defmodule AgentRefWeb.ErrorJSONTest do
  use AgentRefWeb.ConnCase, async: true

  test "renders 404" do
    assert AgentRefWeb.ErrorJSON.render("404.json", %{}) == %{errors: %{detail: "Not Found"}}
  end

  test "renders 500" do
    assert AgentRefWeb.ErrorJSON.render("500.json", %{}) ==
             %{errors: %{detail: "Internal Server Error"}}
  end
end
