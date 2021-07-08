defmodule TanphatGatewayApiWeb.PageController do
  use TanphatGatewayApiWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
