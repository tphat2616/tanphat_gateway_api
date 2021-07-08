defmodule TanphatGatewayApiWeb.ErrorViewTest do
  use TanphatGatewayApiWeb.ConnCase, async: true

  # Bring render/3 and render_to_string/3 for testing custom views
  import Phoenix.View

  test "renders 404.html" do
    assert render_to_string(TanphatGatewayApiWeb.ErrorView, "404.html", []) == "Not Found"
  end

  test "renders 500.html" do
    assert render_to_string(TanphatGatewayApiWeb.ErrorView, "500.html", []) ==
             "Internal Server Error"
  end
end
