defmodule KeyboardLvDemoWeb.PageController do
  use KeyboardLvDemoWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
